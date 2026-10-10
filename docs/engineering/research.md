## What it does

`research` investigates a substantive question using [primary sources](https://www.aihero.dev/ai-coding-dictionary/primary-source), then presents a conclusion with supporting evidence and uncertainty.

It does not turn every factual lookup into a background task or a repository document. Delegation and durable notes are chosen for the actual request.

## When to reach for it

Type `$research`, or Codex can select it for evidence gathering and synthesis beyond an ordinary fact check.

| Request | Output |
| --- | --- |
| Investigate a question and explain the result | A cited answer in the conversation |
| Produce a research note or follow an established notes workflow | A file in the requested or conventional destination |
| Read independent sources while other work proceeds | Bounded parallel research when tools are available |

## Evidence and synthesis

Official documentation, source code, specifications, and first-party APIs should support technical claims. Source dates, versions, and applicability matter. A conclusion inferred from those sources should be identified as an inference.

Parallel reading is useful when questions are independent. If delegation is unavailable or adds no value, Codex researches directly.

## Common questions

**Will a quick documentation lookup create a Markdown file?**

No. Files are written when requested or required by an established project workflow. Ordinary answers stay in the conversation.

**Must research use a subagent?**

No. Delegation can reduce elapsed time on independent reading, but a direct investigation is valid.

## It's working if

- Claims link to sources that support them.
- Relevant versions and dates are accounted for.
- The conclusion distinguishes evidence from inference.
- The deliverable matches the requested destination and depth.

## Where it fits

`research` is a standalone evidence-gathering tool. Its findings can inform [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) or an interface discussion using [codebase-design](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/codebase-design.md). [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the wider workflow.
