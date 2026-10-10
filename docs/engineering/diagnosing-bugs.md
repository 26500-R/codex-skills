## What it does

`diagnosing-bugs` investigates hard bugs, intermittent failures, and measured performance regressions. Its central tool is a **tight feedback loop** that distinguishes the reported failure from a passing result.

Reproduction is preferred, but its absence does not prohibit reading code, inspecting logs, or forming hypotheses. Conclusions remain qualified by the evidence available.

## When to reach for it

Type `$diagnosing-bugs`, or Codex can select it when systematic investigation is needed.

| Situation | Approach |
| --- | --- |
| A difficult or intermittent failure | Build a focused reproduction and test competing explanations |
| A performance regression | Establish measurements before changing the code |
| A routine error explanation or obvious local fix | Answer or fix directly without the full workflow |
| A general performance audit with no symptom | Use an audit scoped to that request |

## Evidence before confidence

The investigation reuses existing reproduction work, narrows it when useful, and tests falsifiable hypotheses. It does not require a fixed number of hypotheses or perfect minimization before useful analysis can continue.

A regression test should exercise the real failure pattern through an appropriate interface. An unrelated mock that passes quickly is weaker evidence than a slower test that reaches the actual bug.

## Common questions

**What if the failing environment is unavailable?**

Codex can inspect available code and logs, state likely causes, and identify the next distinguishing check. It should name the missing evidence and cannot claim the original symptom is verified fixed.

**Does a passing stress run prove an intermittent bug is gone?**

No. The result should include the run count and failure frequency, with the remaining uncertainty. Increasing reproduction frequency helps investigation but must not change the bug being studied.

**Will it repeat work already done in triage?**

It should reuse existing traces, commands, and findings, checking that they apply to the current code and reported symptom.

## It's working if

- Each probe tests a concrete prediction.
- The test or measurement reaches the user's symptom.
- Temporary instrumentation is removed.
- The report separates the supported cause from remaining uncertainty and states the checks actually run.

## Where it fits

This is a standalone investigation. [tdd](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/tdd.md) supplies useful regression-test discipline; [retro](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/retro.md) can examine prevention afterward when requested. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the wider workflow.
