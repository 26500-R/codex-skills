## What it does

`prototype` builds **throwaway code that answers one design question**. It delivers a runnable exploration and reports what the exploration establishes and what remains uncertain.

Completing a prototype does not automatically promote code into production, create a commit or branch, or update an issue. Those steps belong to a follow-on request or an already authorized workflow.

## When to reach for it

Type `$prototype`, or Codex can select it when an unresolved design question needs something concrete to inspect.

| Question | Artifact |
| --- | --- |
| Does this logic or state model behave as intended? | A self-contained HTML demo with state, actions, and guided scenarios |
| What should this interface look like? | Distinct UI variants in the application's context where practical |

If the design is settled and implementation is requested, proceed with implementation. An unexplained defect in existing code belongs with [diagnosing-bugs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/diagnosing-bugs.md).

## Keep the question visible

The prototype should state its question, be easy to run, and expose relevant state. Use in-memory data by default and stub real mutations. Spend effort on the uncertainty being tested rather than production hardening.

Keep the result available for evaluation. Production integration needs its own validation because prototype code was written to explore a question.

## Common questions

**Does throwaway mean the file is deleted when it is finished?**

No. The runnable artifact stays available so the user can evaluate it. Durable archiving, commits, and issue links are created when they are in scope.

**Will the selected variant replace the live page automatically?**

No. Choosing a direction and implementing it in production are separate steps unless the request includes both.

**Should I prototype the whole application?**

This skill works best on a specific uncertainty with a clear stopping point. A full sales demo or application build needs a separately defined deliverable.

## It's working if

- The question is visible and narrow enough to answer.
- The user can run the artifact and inspect the relevant behavior.
- UI options differ in structure rather than only color.
- The report states observations and uncertainty without silently expanding into implementation.

## Where it fits

`prototype` is a standalone way to resolve a design uncertainty. Its result can inform [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) or a [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) discussion. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the full set.
