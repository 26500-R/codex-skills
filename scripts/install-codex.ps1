[CmdletBinding()]
param([string]$Destination)

$ErrorActionPreference = 'Stop'
if (-not $Destination) {
    $codexRoot = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path ([Environment]::GetFolderPath('UserProfile')) '.codex' }
    $Destination = Join-Path $codexRoot 'skills'
}
$destinationProvider = $null
$destinationDrive = $null
$skillRoot = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination, [ref]$destinationProvider, [ref]$destinationDrive).TrimEnd([char[]]'\/')
if ($destinationProvider.Name -ne 'FileSystem') { throw 'Destination must use the FileSystem provider.' }
$repoRoot = Split-Path $PSScriptRoot -Parent
$sources = @('engineering', 'productivity') | ForEach-Object {
    Get-ChildItem -LiteralPath (Join-Path $repoRoot "skills/$_") -Directory |
        Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') }
}
if (-not $sources -or @($sources.Name | Select-Object -Unique).Count -ne $sources.Count) {
    throw 'No promoted skills found, or skill names are duplicated.'
}

function Assert-PlainTree([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return }
    $item = Get-Item -LiteralPath $Path -Force
    if (-not $item.PSIsContainer -or ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
        throw "Expected a plain directory: $Path"
    }
    foreach ($child in (Get-ChildItem -LiteralPath $Path -Force)) {
        if ($child.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Linked path requires manual handling: $($child.FullName)" }
        if ($child.PSIsContainer) { Assert-PlainTree $child.FullName }
    }
}

# Check the resolved destination and every target before moving any existing installation.
$cursor = $skillRoot
while ($cursor) {
    if ((Test-Path -LiteralPath $cursor) -and ((Get-Item -LiteralPath $cursor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint)) {
        throw "Destination has a linked ancestor: $cursor"
    }
    $cursor = Split-Path $cursor -Parent
}
foreach ($source in $sources) {
    Assert-PlainTree $source.FullName
    $target = [IO.Path]::GetFullPath((Join-Path $skillRoot $source.Name))
    if ((Split-Path $target -Parent) -ne $skillRoot) { throw "Target escapes the skills directory: $target" }
    if ($source.FullName -eq $target -or $source.FullName.StartsWith($target + [IO.Path]::DirectorySeparatorChar) -or $target.StartsWith($source.FullName + [IO.Path]::DirectorySeparatorChar)) {
        throw "Installation target overlaps source: $target"
    }
    Assert-PlainTree $target
}

New-Item -ItemType Directory -Path $skillRoot -Force | Out-Null
$runId = 'codex-skills-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N').Substring(0, 8)
$stageRoot = Join-Path $skillRoot ('.' + $runId)
$backupRoot = Join-Path (Join-Path (Split-Path $skillRoot -Parent) 'skill-backups') $runId
New-Item -ItemType Directory -Path $stageRoot | Out-Null
foreach ($source in $sources) { Copy-Item -LiteralPath $source.FullName -Destination (Join-Path $stageRoot $source.Name) -Recurse }
New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null

foreach ($source in $sources) {
    $target = Join-Path $skillRoot $source.Name
    $backup = Join-Path $backupRoot $source.Name
    if (Test-Path -LiteralPath $target) { Move-Item -LiteralPath $target -Destination $backup }
    try {
        Move-Item -LiteralPath (Join-Path $stageRoot $source.Name) -Destination $target
    } catch {
        if ((Test-Path -LiteralPath $backup) -and -not (Test-Path -LiteralPath $target)) {
            Move-Item -LiteralPath $backup -Destination $target
        }
        throw "Installation stopped at $($source.Name). Existing copies are backed up at $backupRoot. $($_.Exception.Message)"
    }
}
Remove-Item -LiteralPath $stageRoot
Write-Output "Installed $($sources.Count) skills into $skillRoot"
Write-Output "Previous copies: $backupRoot"
Write-Output 'Start a new Codex chat to reload the skill catalog.'
