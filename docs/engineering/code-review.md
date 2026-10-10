## What it does

`code-review` checks a requested change for correctness, documented standards, and requirements. It selects the actual Git state you asked to review, including work in progress when requested.

Findings are checked against the selected files, deduplicated, and ordered by severity. A code smell is a lead to investigate, not an automatic defect.

## When to reach for it

Type `$code-review`, or Codex can select it when you request a code review.

| Request | Scope |
| --- | --- |
| A branch or PR | Its resolved base and head |
| Changes since an exact commit | That commit to the requested endpoint |
| All uncommitted work | Combined tracked changes and relevant untracked files |
| Staged or unstaged only | Only the selected state |
| Branch plus current edits | Branch changes together with work in progress |

For an unexplained failure rather than a review of changed code, use [diagnosing-bugs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/diagnosing-bugs.md).

## The review lenses

Correctness checks include inputs, failure paths, and interactions with callers. Standards come from the repository's own guidance. Requirements come from the user's request and any relevant issue or specification.

A substantial review can split these checks across available Codex subagents. Reviewers receive the same scope and do not delegate recursively. Small changes can be reviewed directly.

## Common questions

**Does it see uncommitted files?**

Yes, when they are in the requested scope. Staged, unstaged, and untracked changes are distinct states. A staged-only review inspects the index even when the working copy has newer edits.

**Do I need an issue tracker or a written spec?**

No. The conversation may supply the requirements. If none is available, the report identifies the gap and continues correctness and standards review.

**Can I trust every candidate finding?**

Candidates must be checked against the code and their triggering conditions before they enter the report. Validation reduces false positives but does not prove the change is free of bugs. The report states what was actually tested and what remains uncertain.

## It's working if

- The report names the scope you requested and does not omit relevant work in progress.
- The most consequential supported findings appear first, with precise locations and impact.
- Duplicate or speculative findings are removed.
- An empty result states the validation limits rather than claiming exhaustive correctness.

## Where it fits

`code-review` is a standalone review and a closing check for implementation work. [pr](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/pr.md) describes the final reviewed change when a pull request is needed. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the rest of the set.
