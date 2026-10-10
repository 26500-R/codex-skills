## What it does

`implement-spec` implements a spec and its tickets on one **integration branch**. It treats the tickets as a **task graph**, using blocking relationships to compute the **frontier** of work ready to start.

Independent tickets can run through available Codex subagents in isolated worktrees. Work runs serially when tools are unavailable or shared files and interfaces make parallel work unreliable. The frontier follows changes landed on the integration branch, not tracker issues waiting for a PR merge to close.

## When to reach for it

Invoke `$implement-spec`; it is not selected automatically.

| Situation | Use |
| --- | --- |
| A spec with interdependent tickets you want completed | `$implement-spec` |
| One ticket or a small agreed change | [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md) |
| A large plan that still needs useful slices | [to-tickets](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-tickets.md) |
| Existing implementation needing review | [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) |

## Prerequisites

Provide the spec and tickets as local files or tracker references. Existing tracker configuration is sufficient; [setup-matt-pocock-skills](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/setup-matt-pocock-skills.md) is optional for persistent conventions. Parallel execution needs available subagent and worktree capabilities, but their absence does not block serial completion.

## The integration branch

Codex inspects the existing checkout, preserves user changes, and reuses a suitable task branch or creates a `codex/` branch from the intended base. Implementers begin from the correct integration state; a wrong base is corrected with a fresh worktree or a safe update to a clean task-owned branch, never by resetting user work.

Each ticket applies [tdd](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/tdd.md) at the agreed or existing seams and reports its verification. Integration is serialized, conflicts are resolved against the intended behavior, and relevant checks run before the ticket counts as landed. Once all tickets have landed, the complete result receives repository checks and a review against the spec.

## Common questions

**Does it need GitHub or a pull request?**

No. Local files work. Commits, pushes, PR creation and readiness, and ticket closure follow your requested completion scope and repository workflow. An issue that closes on merge remains open until that condition is met.

**Blocked tickets never start, even after their implementation has landed.**

The orchestrator records landed tickets locally and computes the frontier from that record. It does not wait for the tracker's blocked-by count to change when the blocker is already integrated.

**Two implementers need the same file.**

Worktrees isolate edits but do not remove integration conflicts. Codex should serialize tightly coupled tickets or establish the shared interface first. Parallelism is useful only when the work is sufficiently independent.

**A test skipped a fixture inside a worktree.**

Worktrees do not inherit ignored fixtures, local databases, or credentials. The implementer must account for those prerequisites and report skipped verification. A skip is not evidence the behavior passes.

**Can review cause an endless fix loop?**

The broad review runs after the complete spec is implemented. Findings are checked for evidence; supported fixes receive focused verification. Another broad review needs a reason such as substantial new changes or unresolved evidence.

## It's working if

- Ready independent tickets use available concurrency without colliding on shared state.
- A ticket can begin after its blocker lands, even if the blocker issue awaits merge.
- User work and required untracked resources survive worktree operations.
- Review findings are validated before they change the implementation.
- The final branch and any external updates match your requested completion state.

## Where it fits

`implement-spec` is the orchestrated alternative to [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md). It consumes the graph [to-tickets](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-tickets.md) can produce and uses [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) on the integrated result. The planning stages are optional when you already have suitable inputs. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the rest of the set.
