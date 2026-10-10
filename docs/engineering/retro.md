## What it does

`retro` looks back over a coding [session](https://www.aihero.dev/ai-coding-dictionary/session) and suggests improvements to the agent's **[environment](https://www.aihero.dev/ai-coding-dictionary/environment)**, so the next run goes better. It reads the session's own record (the current one by default, or one you point it at in the session logs). It finds the moments where the agent struggled, and gives you a list of candidate fixes, most severe first.

It proposes changes to the environment. Take the bug the agent shipped, the file it needed twenty [tool calls](https://www.aihero.dev/ai-coding-dictionary/tool-call) to find, or the rule the reviewer missed. `retro` does not fix any of them directly. It asks what in the repo let them happen, and proposes the check, pointer, or standard that prevents them next time. It only proposes unless you have also requested implementation of the improvements.

## When to reach for it

You invoke this by typing `$retro`, and the agent won't reach for it on its own.

Reach for it at the end of a session that was harder than it should have been. For example, the agent searched too long for something, made a mistake a tool could have caught, or needed information it could not get. A session with no supported findings can return no recommendations. If you want a verdict on the code the session produced, use [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) instead.

## Where the findings land

Each candidate belongs to one category, and the category decides where the fix goes:

| What went wrong in the session | Fix it with |
| --- | --- |
| The agent took a long time to find a file or fact | A **navigation pointer** from a file it already reads |
| It made a mistake a tool could have caught | An **[automated check](https://www.aihero.dev/ai-coding-dictionary/automated-check)**: lint rule, type, test, pre-commit hook, CI job |
| The reviewer missed a judgement-call mistake | A rule in `CODING_STANDARDS.md` for the reviewer agent |
| Persistent instructions obscure the guidance needed for the task | Prune duplication or move conditional detail into a linked reference |
| A tool call was expensive for what it returned | Streamline the tool, or replace it |
| A steering file is full of lines that change nothing | Delete the **no-ops** |
| The agent needed information it couldn't reach | Widen its access: tee the dev server log to a file, give read-only access to a service |

Put guidance where it is needed: implementation constraints should be discoverable before coding, and review should independently check the result. A reviewer may need requirements and surrounding code as well as a diff. Keep durable constraints in [AGENTS.md](https://www.aihero.dev/ai-coding-dictionary/agents-md) and conditional detail in linked references, so each [context window](https://www.aihero.dev/ai-coding-dictionary/context-window) gets useful information.

For an observed **mechanical** violation, consider a deterministic check in existing tooling. For a judgement call, consider focused prose in existing standards. Missing hooks or CI are not findings by themselves. Each proposal should connect to a concrete failure, likely recurrence, expected benefit, and maintenance cost.

## Common questions

**Does it write the lint rule itself, or wait for a yes? Can I wire it to run after every session?**

A retrospective alone produces suggestions; it installs no hooks or CI jobs. If you also requested implementation, the agent can carry out that authorized scope. Try a proposed check against the repository before relying on it. Running after every session is optional, and a session without supported findings needs no new rules.

**Won't this pile up lint rules forever? Does it ever suggest removing one?**

Partly, and this is its weakest spot. It can remove prose: no-ops in steering files, and steering in `AGENTS.md` or `CLAUDE.md` that belongs in standards or a check. It flags these for deletion when the files are large. It judges them against the one session it reads, so treat each one as a candidate for the deletion test, not a verdict. It does not audit the lint rules, hooks, or CI jobs it proposed last month. It sees one session, so it cannot tell you that a rule now fires too often or that the bug behind it is gone. You must still prune checks yourself. A rule that fires constantly on good code is the sign to remove it.

**Won't it just invent generic advice to fill its categories?**

This is the strongest criticism of it. One user found that "once the job is finished, the AI tends to forget the struggles from the middle of the session and invents generic advice to satisfy the retro categories." Every candidate must come from the session's own record, so the advice is specific to that session. This has a cost as well as a benefit. It rarely invents something irrelevant, but it can give too much weight to whatever this one session was about. Discard any candidate you can't trace to a specific moment. Treat the severity order as a first draft too, because a quiet, expensive mistake can rank below a loud, cheap one.

**My session is long. Run it now, or start fresh?**

By default it reviews the current session. If the relevant evidence is no longer available in the conversation, point it to the session record or an evidence-preserving handoff. Use the current Codex host's supported history tools instead of assuming another host's clearing commands.

**The agent keeps making the same mistake. Should I add a line to `AGENTS.md`?**

First identify why the mistake recurs and whether existing guidance or checks already address it. A durable constraint may belong in `AGENTS.md`; a conditional procedure may belong in a linked reference, and a mechanical error may justify a check. Choose the smallest supported change rather than treating every error as a reason to add instructions.

**My setup mentions `CODING_STANDARDS.md` and I don't have one. Where does it come from?**

No skill ships the file. The first time a session finds a judgement-call rule for the reviewer, `retro` proposes to create it. After you accept, [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) reads it. Any other standards doc you already keep, such as `CONTRIBUTING.md`, works the same way.

**How is it different from `improve-codebase-architecture`?**

The input is different. [improve-codebase-architecture](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/improve-codebase-architecture.md) needs only the code, and looks for structural improvements to it. `retro` needs a session history, and improves the environment the agent works in, not the code. You use both; neither replaces the other.

## It's working if

- Every candidate points back to a specific moment in the session, not a generic best practice.
- Recommendations explain their expected benefit and cost, without requiring new infrastructure for every mistake.
- If a check already existed but was not connected, the finding is to connect it, not a proposal to build a new one.
- The next session on the same kind of task finds what it needs faster.

## Where it fits

`retro` is the last step of the main chain, where you review how the chain went:

```txt
grill-with-docs → to-spec → to-tickets → implement → code-review → retro
```

Run it after a build worth learning from, in the same session or pointed at that session's log. You can skip it after a smooth build.

- [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) is the reviewer agent that `retro` most often tunes. New coding standards go where its Standards axis reads them.
- [writing-for-agents](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/writing-for-agents.md) sets the writing style for every steering file and skill that `retro` proposes, and `retro` loads it before it starts.

[ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) routes across the whole set when you are unsure which skill the situation needs.
