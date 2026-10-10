## What it does

`wait-what` re-explains a point you lost track of. It adds the missing context, uses plain language in your language, and preserves the project's established terms. It changes the explanation rather than merely shortening it.

## When to reach for it

Invoke `$wait-what` when a message did not land. The [agent](https://www.aihero.dev/ai-coding-dictionary/agent) does not reach for it automatically.

Use it when a decision depends on a premise you never saw, a message assumes knowledge you lack, or terminology obscures the point. To examine a plan's assumptions instead, use [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md).

## Restore the missing context

The leading word is **wait**: the immediate task is to restore understanding. The agent can go back beyond the last paragraph when that is where the missing premise lives. A shorter answer is useful only if it is clearer.

If `GLOSSARY.md` exists, the explanation uses its terms and follows `GLOSSARY-MAP.md` where relevant. Otherwise it uses the language already established in the conversation. This skill does not create glossary files.

## Common questions

**Does it require English or a project glossary?**

No. It uses your language and any existing project vocabulary. You do not need to change languages or create a glossary to get a clearer explanation.

**What if I still do not understand?**

Say which point remains unclear, or invoke it again. The agent should supply a different explanation or concrete example, without reducing the answer to unexplained fragments.

## It's working if

- The missing premise becomes explicit.
- The explanation uses familiar terms without losing technical accuracy.
- Existing project terms remain consistent.
- You can follow why the conclusion or next step follows.

## Where it fits

`wait-what` is a reach-for-it-anytime standalone that repairs the current explanation. For a longer learning task, use [teach](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/teach.md). [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) routes across the whole set.
