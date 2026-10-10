# Phase boundaries

A **phase** is a coherent piece of work: exploration, design, implementation, or verification. A boundary is a useful moment to check what context the next piece needs. It is a convenience, not a requirement to interrupt work or change sessions.

## Options

| Option | Use when |
| --- | --- |
| **Continue** | The current conversation contains useful reasoning and the next task remains tractable. |
| **New session** | The user wants a separate conversation and the necessary inputs can be supplied independently. |
| **`$handoff`** | Context must travel to another workspace, colleague, or session as a durable file. |
| **Subagent** | An independent, bounded task can run through available Codex delegation tools. |
| **Host context management** | The current host supports a context summary or compaction mechanism and it is needed for continued work. |

Use only capabilities actually available in the current Codex host. Do not invent slash commands, reset the user's conversation, or assume a fixed token budget. Starting a separate user-visible chat is different from delegating a subtask and requires the user's request.

## Choosing

Preserve the primary reasoning when the next task needs it. A compact summary or handoff can lose constraints, so carry the goal, settled decisions, source references, unresolved questions, and exact work state that matter next. Verify details from primary files when the summary is insufficient.

Delegate work that has a clear output and can proceed independently. The parent remains responsible for integrating and checking the result. If delegation is unavailable, perform the work directly or serially.

When context becomes difficult to use, first preserve the important state and references. Use the host's supported mechanism, or offer a handoff when a user action is necessary. Do not force a context change merely because a phase ended, and do not impose one ticket per session.
