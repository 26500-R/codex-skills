## What it does

`grill-me` takes a **loose idea** and interviews you until you can commit to it. You do not need a worked-out plan to start, because the [session](https://www.aihero.dev/ai-coding-dictionary/session) exists to produce one. It asks in **rounds**, choosing consequential unresolved questions whose prerequisites are settled. It uses your existing answers and authorization, and stops when further questions would not improve the decision.

It is **[stateless](https://www.aihero.dev/ai-coding-dictionary/stateless)**. It writes no files and leaves no workspace behind. The only result is a clearer version of the idea, in your own head.

## When to reach for it

You invoke this by typing `$grill-me`; the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) won't reach for it on its own. Use the current conversation when it already contains the plan and constraints; a fresh conversation is optional.

Reach for it as soon as you have an idea worth taking seriously (a feature, a product direction, a business call, a piece of writing), and long before you have worked out what it involves. Vagueness is not a reason to wait, because the session exists to remove it. If you can already specify the thing precisely, you don't need to grill it.

Which of the three grilling skills you want depends on what is in front of you:

- **Anything, anywhere.** Use `grill-me`. It needs no repo and writes no files, and the subject doesn't have to be code.
- **A codebase to align against.** Use [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md). It is the same interview, but [stateful](https://www.aihero.dev/ai-coding-dictionary/stateful): it reads your code and keeps what it learns in `GLOSSARY.md` and ADRs.
- **Too big for one session.** Use [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md). It charts the effort as a map and runs grilling sessions inside it.

Choose the Codex mode appropriate to the task. An interview-only request ends with decisions and uncertainties, without starting implementation.

## It's a conversation, not an interview

The skill asks the questions, but **you** own the scope. People often miss this. It is the difference between a session that turns an idea into decisions and one that produces confident nonsense.

The failure mode is **passivity**: answering "agreed, agreed, agreed" for forty questions and coming out with a plan the agent wrote and you nodded at. It feels productive because it was long. But you decided nothing, and the result looks more certain than it is.

Being active means steering. Push back on a question that is less detailed than you need. Say when the scope is drifting. Answer "I don't know" and mean it. This skill helps an engineer and does not replace one. The quality of the result depends on the quality of your answers, not on the number of questions.

The opposite error is real but rarer: staying in the interview so long you never reach code.

## Grillable and ungrillable

Some questions can be answered by talking. Others can't, and no amount of grilling will get you there.

"One long form or three pages?" and "how should this interaction feel?" are **ungrillable**. You need something to react to before you can answer them. When you hit one, stop grilling. Build the throwaway version with [prototype](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/prototype.md), look at it, then come back and answer in one line.

Sessions grow too long when you try to talk through an ungrillable question. The agent keeps rephrasing, you keep guessing, and the scope grows with the uncertainty.

## Common questions

**How many questions should I expect, and how do I know when it ends?**
There is no target question count. It asks about unresolved decisions that could change the plan, and finishes when those are resolved or you ask to wrap up. Lower-impact details can remain explicit assumptions.

**It asked me two hundred questions. What went wrong?**
The interview may be exploring branches that do not affect the decision. Narrow the scope or ask it to select the few remaining questions that matter. Use a handoff if the conversation has become difficult to follow.

**Can I go back to one question at a time?**
Yes. Say so in the conversation, or save the preference in `AGENTS.md` if you want it to persist:

```
When grilling, ask one question at a time.
```

**What if I genuinely don't know the answer?**
Say so. "I don't know" is a real answer, and a question you can't answer is usually a sign to prototype rather than to guess.

**Do I start a fresh session before writing the spec?**
No. The value of the session is the [context](https://www.aihero.dev/ai-coding-dictionary/context) you just built. Hand the same conversation straight to [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md).

**Does the model matter?**
The [model](https://www.aihero.dev/ai-coding-dictionary/model) and available evidence affect the quality of the questions. Judge the session by whether it exposes consequential assumptions, not by its length or a fixed model ranking.

## It's working if

- The questions expose material assumptions or tradeoffs without manufacturing disagreement.
- Questions arrive in a few rounds, not one at a time for a long time, and later rounds clearly build on what you said earlier.
- You end up somewhere you didn't expect, because a question showed you a decision you had been making without noticing.
- At the end you could defend each choice to someone who wasn't there.

## Where it fits

`grill-me` is a **standalone you can run anywhere, on anything**. Because it is stateless, it is portable. It needs no repo, workspace, or setup, and does not assume the idea is about software. People use it for business decisions, for writing, and for what to do next: anything they cannot think through clearly on their own.

Portability is the only difference from [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md). That skill runs the same interview, but reads a codebase to align against and records what it learns as `GLOSSARY.md` and ADRs. Both use the [grilling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grilling.md) skill underneath. `grill-me` is the user-invoked entry point that keeps no state.

If what you grilled does turn out to be software, you can hand the same conversation to [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md) and carry on into the build flow (an option, not the point of the skill). When you're unsure which flow fits, [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) routes you.
