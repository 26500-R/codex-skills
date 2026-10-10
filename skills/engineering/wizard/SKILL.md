---
name: wizard
description: Generate an interactive PowerShell or Bash wizard for a multi-step procedure that requires human input, such as credential setup or a manual cutover. Do not use for steps Codex can complete directly.
---

# Wizard

A **wizard** is a script that walks a human through a manual procedure, opens the relevant URLs, explains what to do, captures values, and writes them to the intended destinations. Use it when a repeatable sequence of human-only steps benefits from a program. A single simple action may need only concise instructions.

Choose the shell the user will run: native PowerShell on Windows, Bash for an established Unix, WSL, or Bash workflow. Follow an explicit preference. The Bash implementation can reuse [template.sh](template.sh); PowerShell guidance is below. Do not assume Bash is installed on Windows.

Save a one-off wizard to a suitable scratch or scripts path. Add durable setup documentation or commit it only when that belongs to the requested delivery.

## Process

### 1. Scope the procedure

Read the relevant configuration and documentation to identify required values, existing setup, and actual human-only steps. Use example environment files and variable names without exposing existing secret values.

State the ordered stages and where each value goes. Continue when the requested setup is clear; ask only for consequential missing choices. Each captured value needs a known source, destination, and secret/public classification.

For each stage, verify the current URL and the path the human follows. Consult current official documentation when the UI is uncertain rather than inventing clicks.

### 2. Author for the target shell

Keep stages in dependency order. Open a page before requesting its value, hide secret input, avoid logging values, and summarize completed and skipped steps. Confirm irreversible actions at the stage where they occur.

| Shell | Implementation |
| --- | --- |
| Bash | Copy `template.sh`, author the section below `STAGES`, and set `TOTAL_STAGES`. Reuse its library helpers for prompts, URL opening, environment-file updates, and GitHub writes. |
| PowerShell | Generate a focused `.ps1` using `Read-Host` and `Read-Host -AsSecureString`, native URL opening, and `-LiteralPath` for file operations. Resolve destinations explicitly, preserve unrelated file content, and use the project's dotenv format. |

For PowerShell, keep secrets out of command arguments, history, and output. If a destination requires plaintext, convert only for the write, do not display it, and release unmanaged buffers in `finally`. Send GitHub secrets through standard input. Check native command exit codes, and distinguish a skipped or failed write from a completed one.

For either shell, make repeat runs safe for the intended procedure: preserve existing values unless the user replaces them, and avoid repeating irreversible operations automatically. Match each CI secret or variable to an actual project reference.

### 3. Verify and hand off

- Bash: run `bash -n <script>` and ShellCheck when available; make the script executable when the target environment requires it.
- PowerShell: parse with `System.Management.Automation.Language.Parser.ParseFile` and inspect parser errors; run PSScriptAnalyzer when available.
- Trace every input to its destination and check that secrets cannot be printed. Exercise pure helpers with fake values in an isolated directory when their behavior is nontrivial.
- Do not execute the human workflow end to end. Give the user the script, exact run command for their shell, and any unresolved prerequisite. Do not weaken execution policy globally to run it.
