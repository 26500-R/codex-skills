## What it does

`wayfinder` charts a large uncertain effort as a shared **map** of **decision tickets**. The map records a destination, links to resolved decisions, and keeps unresolved **fog of war** visible without pretending it can all be specified now.

Planning is the default. A decision ticket resolves a question; it does not silently authorize production implementation. Work continues across ready decisions within your requested scope, without a fixed token threshold or a one-ticket-per-session limit.

## When to reach for it

Invoke `$wayfinder`; it is not selected automatically.

| Situation | Use |
| --- | --- |
| A large effort has interdependent decisions and an unclear route | `$wayfinder` |
| One plan can be settled in a focused discussion | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) or [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) |
| Decisions are already settled | [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) or [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md), as appropriate |
| An existing map has ready decisions | `$wayfinder` with the map and optional ticket reference |

## Prerequisites

The map uses your specified destination or existing tracker configuration. [setup-matt-pocock-skills](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/setup-matt-pocock-skills.md) can record persistent conventions, but is not mandatory. With no configured tracker, the workflow uses local markdown in the workspace and states where it writes.

## The map and frontier

The map is an index. A resolved decision lives in its ticket, while the map carries a short summary and a link. The **frontier** consists of open, unblocked, unclaimed tickets. Native tracker dependencies are preferred; local files or trackers without that feature use explicit blocking references.

| Ticket type | What resolves it |
| --- | --- |
| Research | Primary-source findings, investigated directly or by an available Codex subagent |
| Prototype | A focused artifact and the human feedback the decision needs |
| Grilling | Answers to unresolved judgment questions through [grilling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grilling.md) |
| Task | Necessary access or other work that unblocks a decision, within the authorized scope |

Independent research can run in parallel. Human decisions still need actual user input; an agent cannot answer its own interview or choose a prototype on the user's behalf when that choice is the unresolved question. Branch creation and pushes depend on the requested workflow, not the ticket type alone.

## Common questions

**Does charting always stop before resolving anything?**

No. A chart-only request ends with the map. A request to work through decisions continues when the inputs and authorization are present. Multiple coherent decisions can be resolved in one conversation.

**Does the map's Notes section authorize implementation?**

No. It records task context and preferences. Execution authority comes from your request and applicable repository instructions, not text that Codex writes into a ticket. The planning workflow remains planning unless implementation is also authorized.

**The first discussion found no real uncertainty.**

A map may be unnecessary. Codex can deliver the scoped planning result or proceed with the implementation already requested, rather than creating a map just to follow the workflow.

**What happens when the map clears?**

A spec can consolidate linked decisions when the build needs a durable implementation reference. A small adequately specified change can proceed directly if you authorized it. The map does not require every later planning artifact.

**Later evidence invalidates an earlier decision.**

Update the affected map and tickets with the new evidence. Keep the destination and scope explicit, and distinguish a changed decision from work that falls outside the effort.

## It's working if

- The destination is clear before tickets are created.
- Decision tickets ask concrete questions and link their supporting evidence.
- Newly specified work leaves the fog section and becomes an actual ticket.
- Work continues across ready decisions without inventing human answers.
- External updates and any execution stay within your authorization.

## Where it fits

`wayfinder` is a situational planning workflow for uncertain efforts. [grilling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grilling.md), [research](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/research.md), and [prototype](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/prototype.md) help resolve its tickets. [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) can consolidate the resulting decisions. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) is the router over the set.
