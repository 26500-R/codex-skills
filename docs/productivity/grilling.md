## What it does

`grilling` stress-tests a plan, decision, or idea through a focused interview. It maps relevant dependencies as a **design tree**, then asks about unresolved decisions that could materially change the plan. It does not need to visit every possible branch.

Each **round** selects a manageable set from the **frontier**: questions whose prerequisites are settled. A question that depends on another answer waits for a later round. The interview reuses information already supplied and has no target question count.

## When to reach for it

Type `$grilling`, or the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) reaches for it when you ask to be grilled or to examine a plan's assumptions. It is the shared interview guidance used by the other grilling skills.

| What you need | Reach for |
| --- | --- |
| A standalone interview with no saved artifacts | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) |
| An interview grounded in a codebase and its decisions | [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) |
| A map for work spanning multiple sessions | [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) |
| Something to react to before deciding how it should look or feel | [prototype](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/prototype.md) |
| Interview guidance for another skill | Read and apply the installed `grilling` skill |

## The round, the frontier, and who decides

The **design tree** tracks dependencies. The **frontier** contains unresolved decisions ready to discuss. A **round** selects the most consequential independent questions the user can reasonably answer together. Lower-impact details can remain explicit assumptions.

Questions are numbered so you can answer by number. A recommendation appears alongside a question when the evidence supports one, with relevant alternatives. The wording should make your choice clear without nudging you to agree.

The agent inspects facts available from the [environment](https://www.aihero.dev/ai-coding-dictionary/environment), optionally using a [subagent](https://www.aihero.dev/ai-coding-dictionary/subagent) for independent research. It asks you about goals, constraints, and material tradeoffs that the evidence cannot settle. Research delays only questions that depend on it.

The dependency map is a judgment, not a proof. If an answer changes another question, reopen the affected branch. Finish when material uncertainties are resolved, you ask to wrap up, or further questions would not improve the decision. The result states the decisions, assumptions, and remaining uncertainties.

## Common questions

**Can I ask for one question at a time, or cap the interview?**

Yes. Ask for one question at a time, a question budget, or one round. A deeper interview is also available when requested. The skill should prioritize what can change the decision and state what remains uncertain.

**It ran out of questions and started building.**

An interview-only request should end with findings. If you also asked for implementation, the agent can continue once the material decisions are settled, using authorization already given. There is no universal second confirmation step.

**It answered its own questions instead of asking me.**

Available facts and reasonable low-impact assumptions do not need an interview. Your goals and unresolved material tradeoffs do. A recommendation should not silently become your decision. If the answer requires a prototype or external evidence, identify that next step instead of asking the same question again.

**I installed `grill-me` on its own and nothing happens.**

`grill-me` reads this skill to run the interview, so it needs `grilling` installed too. `grill-with-docs` additionally uses [domain-modeling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/domain-modeling.md). Installing the whole set includes these dependencies.

**A wrapper named this skill but never loaded it.**

The wrapper should read the relevant installed `SKILL.md` files with Codex's file tools. A name in the prompt is not evidence that the file was loaded. Check availability and the read trace if the workflow behaves unexpectedly.

## It's working if

- Each question can change the decision, rather than fill out a checklist.
- A round contains questions that do not require one another's answers.
- Later rounds build on answers already given.
- The agent looks up available facts instead of asking you to supply them.
- The conclusion distinguishes decisions, assumptions, and unresolved questions.
- It stops after an interview-only request, or continues work already authorized.

## Where it fits

`grilling` is the shared interview primitive. [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) and [grill-with-docs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/grill-with-docs.md) are its user-invoked entry points; other workflows can read the same guidance when an interview is needed. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) routes across the set.
