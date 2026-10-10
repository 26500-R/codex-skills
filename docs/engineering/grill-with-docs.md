## What it does

`grill-with-docs` interviews you about an uncertain plan and records settled vocabulary and qualifying architectural decisions in your repository. It combines [grilling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grilling.md) with [domain-modeling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/domain-modeling.md), reading both skills' instructions before beginning.

This workflow is **stateful**: invoking it includes maintaining the relevant glossary and ADRs. It reuses answers already present in the conversation, so recording the plan does not require repeating the interview.

## When to reach for it

Invoke `$grill-with-docs`; it is not selected automatically.

| Situation | Use |
| --- | --- |
| An uncertain plan and domain records you want saved | `$grill-with-docs` |
| An interview without repository artifacts, even inside a repo | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) |
| A large effort with interdependent unresolved decisions | [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) |
| Decisions are already settled and need a spec | [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) |
| A decision waits on someone else's knowledge | [to-questionnaire](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/to-questionnaire.md) |

## Prerequisites

The workspace must permit the requested documentation edits. Existing glossary and ADR locations are reused. A root `GLOSSARY-MAP.md`, when present, points to the relevant context's glossary. Files are created only when a settled term or qualifying decision needs recording.

The installed [grilling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grilling.md) and [domain-modeling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/domain-modeling.md) instructions provide the interview and documentation rules. Codex loads them by reading their `SKILL.md` files.

## The paper trail

| What resolves | Where it belongs |
| --- | --- |
| A domain term with a settled definition | The relevant glossary |
| A hard-to-reverse, non-obvious decision with a meaningful trade-off | An ADR |
| A requirement or implementation choice that does not qualify for either | The conversation, or a spec when one is requested |

A glossary is vocabulary, not an implementation plan. Few or no ADRs can be the correct result. Preserve the agreed requirements when moving to [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md); do not assume glossary entries alone capture the whole plan.

## Common questions

**Why were no files created?**

There may have been no new terms or qualifying decisions. If such decisions did occur, check that both dependent skills were read and that the expected workspace and documentation locations were available.

**Can I use this on an existing repo with no domain docs?**

Yes. Ask for that explicitly. Codex reads the code, resolves domain terms with you, and records the resulting vocabulary. Existing project terms take priority over an invented naming system.

**What happens after the interview?**

The requested planning and records are delivered. You can ask for a spec or implementation next; neither is an automatic extra phase. If your original request already included implementation, that authorization remains in force.

## It's working if

- Questions target unresolved decisions rather than facts Codex can inspect.
- Settled terms use the repository's actual vocabulary.
- ADRs explain meaningful constraints and trade-offs, not every conversational choice.
- The output records what was agreed without expanding the feature scope.

## Where it fits

`grill-with-docs` is an optional planning step. It can supply settled decisions to [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md), while [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) uses a map for larger planning efforts. [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) supplies the interview without saved domain records. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the full set.
