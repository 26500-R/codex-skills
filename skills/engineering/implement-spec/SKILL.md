---
name: implement-spec
description: "Implement the result of $to-spec and $to-tickets in code."
---

You have been provided a spec. This spec should have tickets associated with it, describing how to implement the spec.

Resolve the spec and tickets from the user's references or existing repository instructions. Read tracker configuration when the work uses a tracker. Use local files directly when supplied; offer `setup-matt-pocock-skills` only if persistent tracker configuration is needed.

The goal is the entire spec implemented and verified on a single **integration branch**, with ticket status and publication handled within the user's authorized completion scope.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the spec, tickets, research notes, and previous commits. Don't duplicate information already available via pointers.

Use the available Codex subagent and worktree tools for independent tickets. Run serially when those capabilities are absent or tickets share changing interfaces or files. Track completion on the integration branch: a ticket whose changes have landed can unblock another ticket even while its tracker issue remains open awaiting PR merge.

## Steps

1. Read the spec and tickets to understand the task graph.

2. Optionally use an **exploration subagent** for shared codebase or documentation research. Pass relevant references to implementers; write shared notes only when the task needs a durable artifact, in a permitted location accessible to those agents.

3. Inspect the current checkout and reuse a suitable task branch or create a `codex/` integration branch from the intended base. Preserve existing user changes. Open a draft PR after the first merge only when the requested workflow authorizes publishing one; include closing references only for work that PR completes.

4. Assign ready tickets to **implementer subagents** in isolated worktrees where supported. Each implementer:
   - confirms its base before editing; if it is wrong, creates a fresh task worktree or safely updates a clean task-owned branch, without resetting user work;
   - reads the installed `tdd/SKILL.md` and uses the agreed or existing seams to build and verify the ticket;
   - reports changed files, checks run, skipped prerequisites, and its branch or diff. Worktrees do not inherit untracked fixtures or local services; account for those dependencies before claiming verification.

5. Integrate completed tickets serially, using a merger subagent when useful. Check for conflicting edits and verify the integrated behavior before marking the ticket landed. Keep a local record of the task graph and landed tickets.

6. Recompute the **frontier** from landed tickets and start newly ready work within available concurrency. Serialize tickets that cannot be isolated reliably.

7. Once all tickets have landed, complete required repository checks and read the installed `code-review/SKILL.md` to review the whole task diff against the spec. Recheck findings against the code and fix supported defects. Run focused checks for fixes; repeat a broad review only when new evidence or substantial changes justify it.

8. Report the integration branch, verification results, and any unresolved limitations. Commit, push, change PR readiness, and resolve tickets only as authorized by the task and repository workflow. Do not close tracker work whose completion condition is still pending.

9. Clean up only worktrees created for this task, after confirming their work is integrated or safely preserved. Use the managed archive tool for managed Codex worktrees. Preserve required ignored files and any unintegrated changes.
