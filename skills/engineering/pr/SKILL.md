---
name: pr
description: Write a pull request title and body grounded in the final diff, the repository's template, and actual validation results.
metadata:
  credits:
    skill: show-me
    author: Dex Horthy
    organisation: Humanlayer
    url: "https://github.com/humanlayer/skills/blob/main/plugins/show-me/skills/show-me/SKILL.md"
---

Write for a reviewer who has not seen the conversation. Inspect the final diff and follow the repository's PR template when one exists. Use the project's domain language and describe only the final change, its purpose, and the evidence needed to assess it.

## Summary

Lead with the concrete problem and resulting behavior. A trigger and before/after example can clarify a behavioral change. For a small change, a short paragraph is sufficient.

Use a diagram, diff sketch, or shallow tree only when it explains structure or control flow more clearly than prose. Keep it limited to the calls, states, and boundaries relevant to this PR; visual material is optional.

## Validation

Report checks actually performed and their results. Distinguish passing tests, inspection, and checks that could not run. For a bug fix, include a demonstrated before/after when available; do not invent a failing run. Screenshots help when the change is visual and the environment supports capturing it.

## Material risks

Explain compatibility, migrations, rollout, rollback, or data-loss risks when they matter to this change. Omit empty risk categories and fixed ratings for routine edits. Match detail to impact and uncertainty.

Writing the body does not itself create or publish a PR. When publication is already part of the task, use the available GitHub tool or CLI and preserve the drafted formatting.
