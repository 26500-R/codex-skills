## What it does

`ask-matt` maps your situation to a skill or a short route through this set. A **flow** is an optional path, not a checklist every task must complete. It reads the relevant skill instructions before describing their behavior.

A routing question returns a recommendation. If you already asked Codex to carry out the work, the recommendation does not create another permission step. The map covers this fork's 27 promoted skills; it does not discover unrelated third-party skills.

## When to reach for it

Invoke `$ask-matt`; it is not selected automatically.

| Situation | Route |
| --- | --- |
| An uncertain idea | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) for discussion, or [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) when you want domain records saved |
| A settled piece of work | [implement](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement.md), with a spec or tickets only when those artifacts help |
| A whole ticket graph | [implement-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/implement-spec.md) |
| A difficult bug | [diagnosing-bugs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/diagnosing-bugs.md) |
| Raw incoming reports | [triage](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/triage.md) |
| A large effort with unresolved decisions | [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) |
| You already know the skill you want | Invoke it directly |

## Flows and boundaries

The common build route is planning, a spec when needed, tickets when useful, implementation, and review. Prototype and research work can settle a particular open question. A retrospective is a separate request to improve the agent's working environment after an effort.

At a natural phase boundary, continue with useful context, delegate independent work through available Codex tools, or transfer the needed state with [handoff](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/handoff.md). Use only context controls supported by the current host. The router imposes neither a token threshold nor a new conversation for every ticket.

## Common questions

**It says an explicit-only skill is missing.**

Explicit-only skills can be absent from Codex's automatic skill list. The router should check their installed `SKILL.md` files or this repository's promoted directories before declaring them unavailable. Invoke them with `$skill-name`.

**Must I run setup first?**

No. [setup-matt-pocock-skills](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/setup-matt-pocock-skills.md) is for persistent tracker, label, and domain-doc conventions. A review, debugging session, or local implementation can use the information already available.

**Should every feature start with an interview?**

No. Start where the remaining uncertainty is. A clear request can go directly to implementation; a discussion inside a repo does not require writing a glossary.

**How do my adaptations survive updates?**

Keep them as commits in this fork and merge upstream changes into a review branch. A direct replacement of installed skill files can erase local edits. Repository preferences belong in the effective `AGENTS.md`.

## It's working if

- The recommendation matches your remaining work and skips unnecessary artifacts.
- Claims about a skill follow a read of its instructions.
- Manual skills remain available even when absent from the automatic list.
- The route respects your existing choices and Codex's available tools.

## Where it fits

`ask-matt` is the standalone router over the set, not a mandatory step in a chain. Its summaries orient you; the referenced `SKILL.md` files define the behavior. The other documentation pages link back here so they do not each redraw the whole map.
