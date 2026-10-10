## What it does

`domain-modeling` sharpens the project's domain concepts and vocabulary. It tests definitions against concrete scenarios and existing code, keeping agreed meanings distinct from proposals.

A terminology discussion does not automatically create or edit documentation. Durable changes follow the user's request or an established project workflow.

## When to reach for it

Type `$domain-modeling`, or Codex can select it when terms are ambiguous, a domain model is changing, or a glossary or architectural decision record needs editing.

Simply reading an existing glossary to use the right words does not require a separate modeling exercise.

## Vocabulary and decisions

Use the project's existing names and locations, including `CONTEXT.md` where that is the convention. A glossary defines domain concepts, not implementation plans.

An architectural decision record is useful for a decision that is costly to reverse, surprising without context, and the result of a real tradeoff. Routine choices do not need one.

## Common questions

**Will it create GLOSSARY.md during a discussion?**

Only when durable documentation is requested or already part of the project workflow. Otherwise the agreed definition remains in the conversation.

**Must I rename an existing CONTEXT.md?**

No. The skill respects existing glossary and decision-record conventions. Its sample structure is a default for new documentation, not a migration requirement.

**What if the code and our definition disagree?**

The discrepancy should be stated with concrete evidence. It may expose outdated documentation, an implementation defect, or a genuinely unresolved domain rule.

## It's working if

- Ambiguous words become explicit concepts with examples.
- Definitions distinguish agreed rules from proposals.
- Code contradictions are explained rather than silently resolved by guessing.
- Documentation changes stay within the requested scope.

## Where it fits

`domain-modeling` is a standalone reference used in design discussions. [codebase-design](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/codebase-design.md) complements it with interface and module concepts; [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) drives a broader design discussion with documentation in scope. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the rest.
