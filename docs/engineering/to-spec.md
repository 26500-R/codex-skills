## What it does

`to-spec` synthesizes the current conversation and relevant repository facts into a **spec**. It records what is already agreed instead of starting another interview.

The specification is sized to the work: enough detail for implementation and review, without invented user stories or repeated generic advice. Architectural work can use behavior, interface, and invariant requirements instead of product-style stories.

## When to reach for it

Invoke `$to-spec`; it is not selected automatically.

| Situation | Use |
| --- | --- |
| Settled decisions need a durable implementation and review reference | `$to-spec` |
| A small clear change is ready to build | [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md) directly |
| Material requirements are still undecided | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) or [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) |
| A completed decision map needs consolidation | `$to-spec` with the [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) map |
| An adequate plan already exists and only needs decomposition | [to-tickets](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-tickets.md) |

## Prerequisites

Use the destination already specified by you or the repository. A tracker URL and existing conventions are sufficient; [setup-matt-pocock-skills](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/setup-matt-pocock-skills.md) is optional for persistent configuration. If the publishing destination is missing, Codex prepares the spec before asking for that choice. A draft-only request remains a draft.

## Decisions and test seams

The spec records the problem, solution, requirements, implementation decisions, testing decisions, and scope boundaries relevant to the task. It respects existing glossary terms and ADRs.

A **seam** is the interface where tests observe behavior. Existing public interfaces and agreed testing decisions normally provide enough information. An unresolved interface choice is flagged where it matters; it does not force a repeated approval of established seams or block the rest of the draft.

## Common questions

**Does every parent spec get `ready-for-agent`?**

No. The configured spec label is preferred. If `ready-for-agent` automatically dispatches work, applying it to the parent can start the entire feature instead of its tickets. Codex checks that meaning before applying the label.

**Why not write tickets directly?**

You can. A spec helps when several tickets or sessions need one durable account of the decisions. Small changes and already adequate plans do not need an extra synthesis step.

**Is this only for user-facing features?**

No. Refactors and infrastructure changes use concrete interface, behavior, and invariant requirements. A long list of fictional user stories would obscure those constraints.

**What if a tracker truncates the spec?**

Keep the spec scoped and make sure the published artifact can be retrieved completely. Continue from the conversation while it remains available, or use the complete source artifact. A fixed context reset schedule is not part of this workflow.

## It's working if

- The spec records decisions you recognize and flags real unresolved choices.
- Requirements are specific enough to verify without becoming an exhaustive invented backlog.
- Testing decisions name the behavior and failure cases that matter.
- The destination and labels match the requested workflow.
- Out-of-scope items reflect real boundaries of the task.

## Where it fits

`to-spec` is an optional planning artifact between settled discussion and implementation. [to-tickets](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-tickets.md) can split it into verifiable slices, while [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md) can build a sufficiently bounded spec directly. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) is the router over the set.
