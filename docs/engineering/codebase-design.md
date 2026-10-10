## What it does

`codebase-design` is a reference for **deep modules**: substantial behavior behind an interface that callers can understand and use easily.

It supplies design concepts without replacing the project's established vocabulary or starting a codebase-wide redesign. A service, component, or API may already be the project's name for the relevant role.

## When to reach for it

Type `$codebase-design`, or Codex can consult it while a task involves interface design, module depth, dependency seams, or testability.

| Need | Reference |
| --- | --- |
| Understand the interface and what it hides | The core vocabulary |
| Consolidate logic across dependencies | The deepening guidance |
| Compare meaningfully different interfaces | The design-it-twice guidance |

## Depth and seams

Depth describes how much behavior an interface makes available relative to what callers must learn. The interface includes invariants, ordering, error modes, configuration, and performance obligations, not merely a type signature.

A seam is where behavior can vary. The design should justify that variation rather than add indirection for hypothetical flexibility. Existing domain and architecture terminology remains useful; clarify its relation to these concepts when necessary.

## Common questions

**Must the project stop saying service, component, or API?**

No. Preserve established terms and use this vocabulary to make distinctions clearer. Renaming code is not implied by consulting a design reference.

**Does this prescribe a folder structure?**

No. A module can be a function, class, package, or larger slice. Depth is about the interface and hidden behavior, not a particular filesystem layout.

**Does design-it-twice need a specific agent tool?**

No. Use available Codex subagent tools when parallel exploration helps. Alternatives can also be explored directly. The comparison stays within the candidate the user is designing.

## It's working if

- The discussion explains what callers must know and what the module hides.
- Proposed seams have a concrete reason to vary.
- Changes remain scoped to the requested design question.
- Existing project terminology is clarified rather than mechanically replaced.

## Where it fits

`codebase-design` is a shared reference. [tdd](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/tdd.md) uses it when a test interface needs design, while [domain-modeling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/domain-modeling.md) addresses the problem domain's concepts. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the wider set.
