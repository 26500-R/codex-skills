## What it does

`implement` builds work already described in a ticket, spec, or agreed conversation. It preserves the settled scope, applies [tdd](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/tdd.md) where behavior tests add value, runs relevant checks, and uses [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) on the completed task diff.

The deliverable is verified implementation. Committing, pushing, opening a PR, and updating tickets follow your requested completion scope and repository instructions; invoking this skill alone does not require all of those actions.

## When to reach for it

Invoke `$implement`; it is not selected automatically.

| Work you have | Use |
| --- | --- |
| A clear ticket, spec, or conversation plan | `$implement` with that reference |
| A whole spec with interdependent tickets | [implement-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement-spec.md) |
| A concrete behavior you want test-first | [tdd](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/tdd.md) directly |
| Existing code you only want reviewed | [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) directly |
| Material requirements still undecided | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) or [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md), if you want an interview |

## Prerequisites

Use a workspace where Codex may make the requested edits. It inspects the current branch and worktree and preserves unrelated changes. A ticket reference needs enough tracker information to resolve it; existing configuration or an explicit issue URL is sufficient.

## Testing at seams

The **seam** is the public interface where a test observes behavior. Agreed interfaces and existing project seams are sufficient to begin; Codex asks only when an unresolved choice materially affects the work.

Focused tests and typechecking follow relevant changes. The final checks match the repository's requirements and the scope of the implementation. The review includes staged, unstaged, and relevant new files, so a commit is not needed just to make the review see the work.

## Common questions

**Does it always commit?**

No. Ask for the completion state you want. If the task includes a commit, Codex stages this task's changes only. If it includes a PR, [pr](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/pr.md) helps write the body. Otherwise the verified diff remains available for review.

**Can it work through several tickets?**

Yes, within the requested scope. A new session per ticket is optional. For graph orchestration and isolated parallel implementation, use [implement-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement-spec.md); shared checkouts are unsuitable for independent agents changing branches or the index concurrently.

**What happens to review findings?**

Codex verifies each finding against the code, fixes supported defects, and runs focused checks. It does not implement every suggestion simply because a reviewer wrote it.

**A ticket reference resolved to the wrong item.**

The skill fetches the ticket and states its title before starting. Use an issue URL or `owner/repo#42` when a bare number is ambiguous.

## It's working if

- The implementation matches the existing plan without an unnecessary interview.
- Behavior tests exercise the agreed or existing interfaces.
- The final review sees the entire task diff, including uncommitted files.
- Checks and remaining limitations are reported accurately.
- Commits and external updates match the completion scope you requested.

## Where it fits

`implement` is an implementation step that can be used directly. [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) and [to-tickets](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-tickets.md) can supply its input, and [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) checks its result. [implement-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement-spec.md) manages larger ticket graphs. Use [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) when the route is unclear.
