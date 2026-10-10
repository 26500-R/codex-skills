---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
---

Implement the work described by the user in the spec, tickets, or agreed conversation. Preserve the settled scope and inspect the current branch and worktree before editing.

If the user passes a ticket reference, fetch it from the issue tracker and state its title before starting. If the reference is ambiguous, ask.

Read the installed `tdd/SKILL.md` and apply it where behavior tests add useful coverage, using agreed interfaces or existing project seams. Ask only when an unresolved choice materially affects the work.

Run focused tests and relevant typechecking as the implementation changes. Complete the repository's required checks at the end; report any checks that could not run.

Once done, read the installed `code-review/SKILL.md` and review the full task diff, including staged, unstaged, and relevant new files. Fix findings supported by evidence, then run focused checks for those fixes.

Commit, push, open a PR, and update tickets only within the user's requested completion scope and repository instructions. Stage only this task's changes when committing. Otherwise leave the verified diff for review and report its state.
