## What it does

`pr` writes a pull request title and body for a reviewer who has not seen the conversation. It follows the repository's template and grounds its claims in the final diff and actual validation.

The amount of explanation matches the change. A small fix may need only a short paragraph and a test result; diagrams and risk sections are useful when they clarify a substantial change.

## When to reach for it

Type `$pr`, or Codex can select it when writing or updating a pull request description.

Use [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) when the task is to find defects in the change rather than explain it to reviewers.

## What the reviewer needs

The body explains the concrete problem, resulting behavior, and how the change was checked. Compatibility, rollout, rollback, and data-loss risks belong when they are material. Empty categories and compulsory visual templates do not help a routine edit.

## Common questions

**Which template wins if my repository already has one?**

The repository's template. The skill supplies writing guidance within that structure.

**Does every PR need before-and-after screenshots or a failing test?**

No. Screenshots help visual changes; demonstrated before-and-after results help bug fixes. The body reports evidence that actually exists and identifies checks that could not run.

**Does invoking it publish the PR?**

Writing the description alone does not publish anything. If creating or updating the PR is already part of the task, Codex can use the available GitHub tool or CLI to do that work.

## It's working if

- The reviewer can understand the problem and final behavior without the chat history.
- The description follows the repository template.
- Validation statements match checks actually performed.
- Detail and risk discussion are proportionate to the change.

## Where it fits

`pr` is a writing step when work is delivered through a pull request. [code-review](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/code-review.md) checks the change itself. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps the full set.
