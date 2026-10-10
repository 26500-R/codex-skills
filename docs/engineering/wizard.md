## What it does

`wizard` creates an interactive script for a multi-step procedure that still requires human input. It opens relevant pages, explains the steps, captures values, and writes them to the intended destinations.

The script matches the user's shell: native PowerShell on Windows, or Bash for an established Unix, WSL, or Bash workflow. Codex generates and checks the script; the human runs the interactive procedure.

## When to reach for it

Type `$wizard`, or Codex can select it when a sequence of human-only actions benefits from an executable guide.

| Situation | Approach |
| --- | --- |
| Several services need credentials configured | Capture each value and write it to the required local or CI destination |
| A manual cutover has ordered steps | Sequence the actions with confirmation before irreversible operations |
| One simple click is needed | Give a concise instruction |
| Codex can complete the work directly | Complete it without creating a wizard |

## Prerequisites

Generating the wizard requires enough project information to identify the steps and destinations. Running it requires the selected shell and any commands used by its stages. GitHub writes need an available, authenticated GitHub CLI; skipped or failed writes must be reported.

## Stages and verification

Each stage has a known source, destination, and secret/public classification. Existing setup and project references inform the stage list. Missing consequential choices are clarified; a fully specified request does not need an extra approval round before script generation.

Bash wizards can reuse the bundled template. PowerShell wizards use native prompts, hidden secret input, literal file paths, and explicit destination handling. Generated scripts receive shell-appropriate syntax checks and targeted checks for nontrivial helpers, without running the human procedure end to end.

## Common questions

**Do I need Bash on Windows?**

No. PowerShell is the default for a native Windows workflow. An explicit Bash or WSL preference takes precedence.

**Do secrets need to be pasted into the chat?**

No. The user enters them privately when running the script. The wizard should keep them out of logs and command arguments and send GitHub secrets through standard input.

**Does the skill change execution policy or commit the script?**

It does not weaken global execution policy. Committing or documenting a durable setup path happens only when that belongs to the requested delivery.

## It's working if

- The run command works with the user's chosen shell.
- Each input has a specific destination and sensitive input is hidden.
- Repeat runs preserve existing setup unless replacement is requested.
- The closing result distinguishes completed, skipped, and failed actions.

## Where it fits

`wizard` is a standalone tool for the boundary between automated work and human-only setup. [setup-matt-pocock-skills](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/setup-matt-pocock-skills.md) configures this skill set's project conventions; `wizard` handles the remaining manual procedures for the project itself. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the rest.
