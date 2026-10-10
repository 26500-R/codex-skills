## What it does

`handoff` summarizes the current conversation into a short Markdown document that a fresh [agent](https://www.aihero.dev/ai-coding-dictionary/agent) can read to continue the work. By default, it saves the file in the operating system's temporary directory, rather than adding an artifact to the project.

It preserves the objective, current state, decisions, remaining work, blockers, and relevant verification. Existing specs, plans, issues, commits, and diffs appear as paths or URLs instead of duplicated text.

## When to reach for it

Invoke `$handoff` explicitly; the agent does not reach for it automatically. Include the next task's focus when that changes what the handoff needs to preserve.

| Situation | Why a file helps |
| --- | --- |
| Moving to another host or account | The destination cannot see the current conversation |
| Moving to another directory or repository | The work needs portable context |
| Sharing the work with a colleague | They need a readable brief |
| Delegating a side task | The brief can focus on that task's dependencies |

Within the same task, continuing the conversation or using Codex's available compaction or fork features may be enough. Use the features supported by the current host instead of assuming commands from another coding tool exist.

## What travels, and what does not

The handoff carries the live state of the task and the reasons behind relevant decisions. A **suggested skills** section appears when specific installed guidance would help; the next agent reads that guidance using its own host's tools.

Secrets and sensitive personal information are redacted. The document distinguishes verified results, user instructions, assumptions, and untrusted source material. A quoted page or tool output does not become user authorization merely because it appears in a handoff.

A handoff is a summary, so retain links to the primary evidence where the next agent may need to verify a claim. A test that was not run remains unverified.

## Common questions

**Handoff or compaction?**

Use a handoff when you need a portable file or a brief tailored to a separate task. Use the host's available compaction when you are continuing the same task and do not need a separate artifact.

**Where does the file go?**

The default is `$TMPDIR`, falling back to `/tmp`, or `%TEMP%` on Windows. The agent reports the actual path. Temporary storage is not durable; keep the file and its referenced artifacts somewhere persistent if they must survive cleanup or move to another machine.

**How do I hand it to the next agent?**

Point the next conversation at the file and ask it to read the handoff. Do not interpolate the document into a shell command: backticks and `$(...)` can be interpreted as code. Sharing or messaging another task requires the user's authorization.

**Is it the same as a fork?**

A host-provided fork can preserve conversation history. This skill writes a targeted summary that can travel separately. Choose the one that preserves the context the destination actually needs.

**When does something belong in `AGENTS.md` instead?**

Durable project constraints can belong in `AGENTS.md` or a linked project document. An unfinished task's current state belongs in a handoff. Invoking this skill does not request edits to persistent instructions.

**Why did the next agent treat a guess as fact?**

A handoff should label assumptions and unverified results. Read consequential claims against their linked evidence, especially completion and test claims, before relying on them.

## It's working if

- You can read the document without the original conversation and identify the next step.
- Existing artifacts are linked rather than copied.
- Verified work and unresolved assumptions are distinguishable.
- The next agent can find the evidence needed to continue.
- Secrets and unsupported authorization are absent.

## Where it fits

`handoff` is a reach-for-it-anytime standalone for moving work between conversations or environments. [prototype](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/prototype.md) may benefit from a focused handoff when an experiment runs separately. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) helps choose among continuing, delegating, and handing off.
