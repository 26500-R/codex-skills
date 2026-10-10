---
name: diagnosing-bugs
description: Diagnose hard bugs, intermittent failures, or measured performance regressions when the cause is unclear and systematic investigation is needed. Routine error explanations and obvious local fixes do not require this workflow.
---

# Diagnosing Bugs

A discipline for hard bugs. Scale the investigation to the uncertainty, reuse existing reproduction evidence, and stop once the cause and fix have adequate support.

When exploring the codebase, read `GLOSSARY.md` (if it exists) to get a clear mental model of the relevant modules, and check ADRs in the area you're touching.

## Redact

This skill has you show commands, outputs and captured artifacts. **Redact every secret first**: write `<REDACTED>` in its place. Build loops against env vars, so the credential stays in the environment rather than in what you show. Captured artifacts carry auth headers: quote only the lines that carry the signal.

If the redacted output is not enough to diagnose the bug, say so and ask the user.

## Phase 1: Build a feedback loop

Prefer a **tight** pass/fail signal for the reported symptom. Bisection, hypothesis testing, and instrumentation become more useful when each result can be compared. Read relevant code and logs while constructing the loop; static analysis can identify a cause or the right reproduction path.

### Ways to construct one, in roughly this order

1. **Failing test** at whatever seam reaches the bug: unit, integration, e2e.
2. **Curl / HTTP script** against a running dev server.
3. **CLI invocation** with a fixture input, diffing stdout against a known-good snapshot.
4. **Headless browser script** (Playwright / Puppeteer) that drives the UI and asserts on DOM/console/network.
5. **Replay a captured trace.** Save a real network request / payload / event log to disk; replay it through the code path in isolation.
6. **Throwaway harness.** Spin up a minimal subset of the system (one service, mocked deps) that exercises the bug code path with a single function call.
7. **Property / fuzz loop.** If the bug is "sometimes wrong output", run 1000 random inputs and look for the failure mode.
8. **Bisection harness.** If the bug appeared between two known states (commit, dataset, version), automate "boot at state X, check, repeat" so you can `git bisect run` it.
9. **Differential loop.** Run the same input through old-version vs new-version (or two configs) and diff outputs.
10. **Human-assisted loop.** If the environment requires human interaction, give bounded steps and a way to return the result. Use `scripts/hitl-loop.template.sh` when Bash fits the environment; otherwise use native shell instructions or a suitable local script.

### Tighten the loop

Treat the loop as a product. Once you have _a_ loop, **tighten** it:

- Can I make it faster? (Cache setup, skip unrelated init, narrow the test scope.)
- Can I make the signal sharper? (Assert on the specific symptom, not "didn't crash".)
- Can I make it more deterministic? (Pin time, seed RNG, isolate filesystem, freeze network.)

Prefer the fastest reliable signal that still exercises the real failure. A slow integration test can be stronger evidence than a fast mock that misses the bug.

### Non-deterministic bugs

Aim for a **higher reproduction rate** without changing the failure being investigated. Repeat or stress the trigger as appropriate, recording the number of runs and failures. A run with no failures is evidence with limits, not proof that an intermittent bug is gone.

### When you genuinely cannot build a loop

Say what could not be reproduced and what evidence is missing. Continue useful static analysis, log inspection, and ranked hypotheses, clearly marking what is inferred. Ask for the specific environment access or redacted artifact needed for further verification; production instrumentation is separate work unless already authorized. Do not claim the original symptom is fixed without evidence that reaches it.

### Reproduction quality

When a runnable reproduction is available, record a command or procedure you have actually run, the relevant redacted result, and its limitations. Aim for:

- [ ] **Red-capable**: it drives the actual bug code path and asserts the **user's exact symptom**, so it can go red on this bug and green once fixed. Not "runs without erroring"; it must be able to _catch this specific bug_.
- [ ] **Repeatable**: stable inputs and conditions, with measured failure frequency for intermittent bugs.
- [ ] **Focused**: setup and runtime are no larger than needed to exercise the symptom.
- [ ] **Runnable**: unattended where possible, with explicit human steps where necessary.

Where these goals cannot be met, carry the limitation into the hypothesis and verification stages instead of blocking all analysis.

## Phase 2: Reproduce + minimise

When a runnable loop is available, run it and check that its failure matches the report.

Confirm:

- [ ] The loop produces the failure mode the **user** described, not a different failure that happens to be nearby. Wrong bug = wrong fix.
- [ ] The failure is reproducible across multiple runs (or, for non-deterministic bugs, reproducible at a high enough rate to debug against).
- [ ] You have captured the exact symptom (error message, wrong output, slow timing) so later phases can verify the fix actually addresses it.

### Minimise

Once it's red, shrink the repro to the **smallest scenario that still goes red**. Cut inputs, callers, config, data, and steps **one at a time**, re-running the loop after each cut, and keep only what's load-bearing for the failure.

Why bother: a minimal repro shrinks the hypothesis space in Phase 3 (fewer moving parts left to suspect) and becomes the clean regression test in Phase 5.

Minimise only while it helps isolate the cause or produce a useful regression test. Preserve the original scenario for final verification. If reproduction is unavailable, proceed with the evidence you have and label the uncertainty.

## Phase 3: Hypothesise

Rank plausible hypotheses supported by the current evidence. Consider competing explanations when the cause is uncertain, without inventing alternatives to meet a fixed count.

Each hypothesis must be **falsifiable**: state the prediction it makes.

> Format: "If <X> is the cause, then <changing Y> will make the bug disappear / <changing Z> will make it worse."

If you cannot state the prediction, the hypothesis is a vibe: discard or sharpen it.

Share the leading hypothesis and the next distinguishing check when useful. Incorporate the user's domain evidence without adding a mandatory approval checkpoint before each experiment.

## Phase 4: Instrument

Each probe must map to a specific prediction from Phase 3. **Change one variable at a time.**

Tool preference:

1. **Debugger / REPL inspection** if the env supports it. One breakpoint beats ten logs.
2. **Targeted logs** at the boundaries that distinguish hypotheses.
3. Never "log everything and grep".

**Tag every debug log** with a unique prefix, e.g. `[DEBUG-a4f2]`. Cleanup at the end becomes a single grep. Untagged logs survive; tagged logs die.

**Perf branch.** For performance regressions, logs are usually wrong. Instead: establish a baseline measurement (timing harness, `performance.now()`, profiler, query plan), then bisect. Measure first, fix second.

## Phase 5: Fix + regression test

Write the regression test **before the fix**, but only if there is a **correct seam** for it.

A correct seam is one where the test exercises the **real bug pattern** as it occurs at the call site. If the only available seam is too shallow (single-caller test when the bug needs multiple callers, unit test that can't replicate the chain that triggered the bug), a regression test there gives false confidence.

**If no correct seam exists, that itself is the finding.** Note it. The codebase architecture is preventing the bug from being locked down. Flag this for the next phase.

If a correct seam exists:

1. Turn the minimised repro into a failing test at that seam.
2. Watch it fail. If you forced the red by mutating code or a fixture, `diff` against a pristine copy to prove the mutation landed before you trust it.
3. Apply the fix.
4. Watch it pass.
5. Re-run the Phase 1 feedback loop against the original (un-minimised) scenario.

## Phase 6: Cleanup

Required before declaring done:

- [ ] Re-run the original repro when available; otherwise state that the original symptom remains unverified
- [ ] Regression test passes (or absence of seam is documented)
- [ ] All temporary `[DEBUG-...]` instrumentation removed (search the prefix)
- [ ] Throwaway prototypes deleted (or moved to a clearly-marked debug location)
- [ ] Report the supported cause, final change, validation results, and remaining uncertainty; include the cause in a commit or PR description only when producing one is in scope
