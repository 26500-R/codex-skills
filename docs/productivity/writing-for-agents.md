## What it does

`writing-for-agents` is the reference for writing agent-facing documents: a skill, an `AGENTS.md` or `CLAUDE.md`, a [spec](https://www.aihero.dev/ai-coding-dictionary/spec), a runtime prompt, a README, any doc an [agent](https://www.aihero.dev/ai-coding-dictionary/agent) reads. It helps preserve useful constraints, expose references when needed, and remove guidance that does not improve the task. These are authoring heuristics to check against actual runs, not guarantees about every model.

A **no-op** is an instruction that adds [context](https://www.aihero.dev/ai-coding-dictionary/context) without changing useful behavior. The reference helps identify candidates for removal while retaining task-specific requirements. Whether a line is redundant depends on the task and [model](https://www.aihero.dev/ai-coding-dictionary/model); check representative behavior before deleting important constraints.

It was called `writing-great-skills` until v1.1. The new name fits what it always was. Almost none of it is specific to skills. The skill-only mechanics (frontmatter, the model- versus user-invoked choice, router skills) live in a linked `SKILL-MECHANICS.md` that you read only when the document in front of you is a skill.

## When to reach for it

Type `$writing-for-agents`, or the agent reaches for it on its own when you're creating or editing a skill, or modifying `AGENTS.md` or `CLAUDE.md`.

Reach for it by hand for everything else an agent reads: your docs, specs and [tickets](https://www.aihero.dev/ai-coding-dictionary/ticket), system and [AFK](https://www.aihero.dev/ai-coding-dictionary/afk) prompts. The test is one question: does an agent read this? It does not matter how the agent gets the document: a pointer names it, a human pastes it, or it is in the repo. To find out what a codebase contains, use [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md). This reference controls how a document reads, not what it knows.

## The two loads

The central idea is two budgets that every document and pointer spends:

- **Context load**: the cost of always-loaded material on the agent's window: an `AGENTS.md` line, a skill description, anything sitting in context every [turn](https://www.aihero.dev/ai-coding-dictionary/turn) whether or not it fires.
- **Cognitive load**: the cost to you of remembering which documents exist and when to reach for each. You are the index. Spend this effort where an explicit user choice is useful; avoid unnecessary menus and handoffs.

Once you think in these two loads, most authoring decisions (split or don't, inline or disclose, point or push) become the same trade made in different places.

## The levers

- **[Context pointers](https://www.aihero.dev/ai-coding-dictionary/context-pointer)**: the reference held in context that names out-of-context material and encodes when to reach it. A skill description and an `AGENTS.md` line naming a doc are the same thing. A clear read condition helps the agent find the right material.
- **Information hierarchy**: the ladder from in-file step, to in-file reference, to disclosed reference behind a pointer. **[Progressive disclosure](https://www.aihero.dev/ai-coding-dictionary/progressive-disclosure)** is moving material down that ladder so the top stays easy to read.
- **Completion criteria**: checkable conditions for finishing the task, proportionate to its scope and risk.
- **Leading words**: established terms for recurring concepts, such as *tracer bullet*. Shared vocabulary connects pointers with guidance, but ambiguous shorthand should not replace explicit constraints.
- **Pruning**: single source of truth, relevance, and the no-op test applied sentence by sentence, against **duplication**, **sediment** and **sprawl**.

## Codex invocation policy

Codex reads `agents/openai.yaml` for invocation policy. `policy.allow_implicit_invocation: false` keeps a skill explicit-only through `$skill-name`; omitting the setting allows automatic selection. Preserve the existing policy when editing a skill unless the user requests a change. The Claude Code `disable-model-invocation` frontmatter field does not control Codex.

Manual invocation policy does not make files unreadable. An authorized workflow can read a referenced `SKILL.md` or shared reference without inventing a new user request. Router skills should recommend when asked for advice and apply relevant guidance when the underlying work is already authorized.

## Common questions

**Where did `/writing-great-skills` go?**
It is this skill, renamed in v1.1. Users pointed it at `AGENTS.md`, docs, specs, tickets and runtime prompts long before the rename. Structure, leading words and pruning apply to any text an agent reads. There is no alias. Reinstall under the new name.

**"Writing for agents": so the agent does the writing?**
The phrase describes the audience: an agent will consume the document. Either a person or Codex can write it. Include the non-obvious guidance that helps that reader perform the intended task.

**Can't I just ask the agent to write it for me?**
Yes. Review the result for task scope, real constraints, useful reference links, and unsupported assumptions. Remove generic instructions when they add no value; do not assume every model-generated draft has the same defects.

**I asked an agent to trim a document and it cut the functionality.**
A length-only target can remove useful constraints. The no-op test checks behaviour, not style: delete the line and ask whether the agent's behaviour changed. When a sentence fails, delete the whole sentence rather than trim words from it, and settle a disagreement about it by running the document, not by arguing.

**How do I know when it's done?**
When it supports the intended tasks and preserves their constraints without unnecessary instructions. Use representative runs for behavior, plus structural validation for skill packaging. Neither a short file nor a passing metadata check proves the workflow is correct.

**Should this live in `AGENTS.md` or somewhere else?**
Keep durable project constraints in Codex's `AGENTS.md`; place conditional detail in a linked reference. A [session](https://www.aihero.dev/ai-coding-dictionary/session) needs the guidance relevant to its task, not every procedure in full. `CLAUDE.md` is a separate host convention unless your project points to it.

**Do I need to rewrite my documents for each new model?**
Mostly no, and over-fitting to one model causes its own problems. Updating for a new model is usually another no-op pass rather than a rewrite.

**My skill only works on the exact task I built it from.**
The common method (do the work once, then have the agent write it up as a skill) fits that one run too closely, and the examples come out too specific. Keep the run as evidence, then generalise on purpose: strip what belonged to that repo and those files, and write for the class of task.

**English isn't my first language. Do I lose the leading-word advantage?**
Use the language the intended reader and project use. Define specialized terms and keep them consistent; no particular English word guarantees better behavior.

## It's working if

- The intended workflow retains its essential constraints after pruning.
- Shared terms and conditional references make the guidance easier to find.
- Repeated instructions are consolidated where doing so preserves clarity.
- Reference that only one branch needs sits behind a pointer rather than in the main file.

## Where it fits

This is a reach-for-it-anytime standalone reference. It applies to the whole set, not to one skill. Every skill here was written with it, and it also covers the documents the other skills produce (a `GLOSSARY.md` and its ADRs, a spec, a ticket) once an agent has to read them. Its one direct caller is [retro](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/retro.md), which loads it before proposing any steering file or skill. When you're unsure which skill or flow fits a task, [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) routes you over the whole set.
