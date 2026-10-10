# Codex installation

This fork uses the `codex/adaptation` branch. From a local checkout of that branch, run:

```powershell
./scripts/install-codex.ps1
```

The script copies only the promoted engineering and productivity skills to `$CODEX_HOME/skills` (default: `~/.codex/skills`), backs up replaced directories, and leaves other skill names alone. `-Destination <path>` selects another installation directory. Start a new Codex chat after installation so the skill catalog is reloaded.

These are editable local copies, not an automatically updating plugin. Merge reviewed upstream changes into `codex/adaptation`, validate the result, then rerun the installer. The root README contains the complete merge workflow. Do not install the upstream plugin alongside these copies, which would create duplicate skills.
