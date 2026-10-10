## What it does

`to-tickets` breaks an agreed plan, spec, or conversation into **tracer-bullet** tickets with explicit blocking edges. Each slice delivers an independently verifiable outcome through the layers that behavior actually needs.

It avoids both one-ticket-per-layer decomposition and trivial tickets that add coordination without useful separation. Ticket size follows coherent outcomes and dependencies, not a fixed token budget.

## When to reach for it

Invoke `$to-tickets`; it is not selected automatically.

| Situation | Use |
| --- | --- |
| A plan needs independently verifiable implementation slices | `$to-tickets` |
| The whole change is small and clear | [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md) directly |
| A durable record of agreed decisions is missing | [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md), when that record is useful |
| Material requirements remain open | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) or [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) |

## Prerequisites

Use the tracker or local destination already specified by you or the repository. Existing configuration is sufficient; [setup-matt-pocock-skills](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/setup-matt-pocock-skills.md) is optional for persistent conventions. Codex can draft the tickets before an unresolved publishing destination is chosen.

## Slices and blocking edges

A slice should answer: what behavior can be demonstrated when this ticket is complete? Its blocking edges name only work that truly gates it. Necessary prefactoring can precede a dependent slice; optional architecture cleanup stays outside the task.

Codex presents the breakdown and checks it against the agreed plan. It asks about material unresolved choices, but reuses an already approved decomposition or your explicit delegation to choose granularity. Publication stays within the requested scope; a draft-only request remains a draft.

| Destination | Ticket form |
| --- | --- |
| Local markdown | One file per ticket under `.scratch/<feature>/issues/<NN>-<slug>.md`, numbered blockers first |
| Issue tracker | One issue per ticket, with native blocking links where supported and real issue identifiers |

Parent-child relationships and blocking relationships have different meanings. A child issue still needs its actual dependency edges. Publishing tickets does not close the parent spec.

## The wide-refactor exception

A mechanical change across many callers may not support independent vertical slices. Use **expand-contract** where possible: add the new form, migrate bounded batches while the old form keeps working, then remove the old form. If intermediate work cannot stay green, the tickets can share an integration branch and block a final integration-and-verification ticket.

## Common questions

**It made twelve tickets for a three-line change.**

The decomposition is too fine. Keep the change together when it has one small verifiable outcome. A ticket is useful when it reduces implementation or coordination uncertainty, not just because a step can be named.

**The acceptance criteria already pass before implementation.**

Check which observation proves the new behavior, which failure case the ticket owns, and whether the criterion depends on a different ticket. Criteria should describe the delivered behavior rather than restating a generic development activity.

**How do I run the tickets?**

Use [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md) for selected work or [implement-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement-spec.md) to manage the graph. A new conversation per ticket is optional. The executor should track what has landed and update external ticket state according to your completion scope.

**Must every ticket touch the database, API, and UI?**

No. It crosses the layers needed for its behavior. A library change should not gain a UI or database task to satisfy an example.

## It's working if

- Each ticket has a concrete, independently verifiable outcome.
- Blocking edges capture actual prerequisites.
- Small coherent work remains together.
- Publishing reuses the agreed destination and authorization.
- Parent issues remain open unless closing them is a separate authorized action.

## Where it fits

`to-tickets` is optional decomposition for a plan that benefits from it. [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) can supply its input, and [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md) or [implement-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement-spec.md) consumes the result. Already specified tickets do not need [triage](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/triage.md). [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the rest of the workflow.
