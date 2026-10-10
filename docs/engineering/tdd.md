## What it does

`tdd` builds requested behavior through **red → green → refactor**: observe a failing behavior test, implement enough to pass it, then make any necessary small cleanup while keeping the tests green.

Tests target stable interfaces and use expected results independent of the implementation. Existing interfaces and project conventions normally provide enough direction to begin.

## When to reach for it

Type `$tdd`, or Codex can select it for an explicitly test-first feature, bug fix, or integration-test task.

| Situation | Reach for |
| --- | --- |
| A defined behavior to implement test-first | `tdd` |
| An unclear cause of an existing failure | [diagnosing-bugs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/diagnosing-bugs.md) |
| The module interface itself needs design | [codebase-design](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/codebase-design.md) as reference |

## Test seams

A **seam** is the interface where the test observes behavior. Codex chooses a relevant seam from the request and existing code, explaining material coverage gaps. It asks when a consequential interface or testing choice remains unresolved, rather than requesting confirmation before every test.

The work proceeds in vertical slices. Writing every imagined test before implementing any behavior can lock in the wrong design.

## Common questions

**Must I approve every seam before work starts?**

No. Established interfaces and test conventions can be used directly within the task. A question is useful when competing choices materially change the contract or coverage.

**Is refactoring part of the cycle?**

Yes, after green. Small behavior-preserving improvements belong in the cycle when needed by the current change. Unrelated redesign is deferred.

**What makes a test tautological?**

A test that calculates its expected answer the same way as the implementation can repeat the same mistake. Use an independent specification, a worked example, or a known-good result.

## It's working if

- A test fails for the intended behavior before the fix.
- Tests observe public behavior and survive internal restructuring.
- Each slice adds behavior supported by the request.
- Relevant checks stay green after necessary cleanup.

## Where it fits

`tdd` is a reference used during implementation. [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) can inspect the completed change for problems the implementation process missed. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the other skills.
