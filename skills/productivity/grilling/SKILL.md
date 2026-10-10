---
name: grilling
description: Stress-test a plan, decision, or idea through a focused interview when the user asks to be grilled or to examine their assumptions.
---

Interview the user to resolve the assumptions and decisions that could materially change their plan. Use a **design tree** to track dependencies between decisions; do not turn every possible branch into a question.

Work the tree in **rounds**. The **frontier** contains unresolved decisions whose prerequisites are settled. Select the most consequential questions the user can reasonably answer together, and leave lower-impact details for later or state a reasonable assumption. Number each question and give a recommendation when the evidence supports one. Wait for answers that the next decisions depend on. Respect a request for one question at a time or a deeper interview.

Format a round like so:

```
❓ **Q1** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>

---

❓ **Q2** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>
```

Keep each recommendation clearly associated with its question so the user can answer by number. Present meaningful alternatives without steering the wording toward agreement.

Each round the user answers reshapes the tree: settled decisions push the frontier outward and unblock questions that depended on them. Recompute the frontier and ask the next round. A question whose answer depends on another question still open in this round belongs to a _later_ round, not this one.

Look up facts available from the environment before asking the user for them. Delegate independent research when useful; direct inspection is enough for a small lookup. Only questions that depend on unfinished research need to wait. Ask the user about goals, constraints, and material tradeoffs that the available evidence cannot settle. Reuse decisions and authorization already given.

Finish when the material uncertainties are resolved, the user asks to wrap up, or further questions would not improve the decision. Summarize the decisions, explicit assumptions, and remaining uncertainties. An interview-only request ends there; continue implementation only when it is already authorized or the user requests it. Do not require a second confirmation of authorization already given.
