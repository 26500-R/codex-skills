# Skill mechanics

The skill-specific branch of [`writing-for-agents`](SKILL.md): what changes when the document is a Codex skill (frontmatter, invocation policy, and router skills). The shared writing guidance is in `SKILL.md`.

## Invocation

Every `SKILL.md` requires a `name` and `description`. In Codex, `agents/openai.yaml` controls implicit invocation:

- A **model-invoked** skill has `policy.allow_implicit_invocation: true`, or omits the setting, whose default is true. Its name and description support automatic selection; the body loads when needed. Users can also invoke it explicitly with `$skill-name`.
- A **user-invoked** skill has `policy.allow_implicit_invocation: false`. It is excluded from automatic context injection and remains available through explicit `$skill-name` invocation. Keep its required description concise and useful to a person choosing it.

Preserve an existing policy unless the user requests a change. For a new skill, keep automatic selection enabled unless the user explicitly wants manual invocation. Narrow the description to its actual task; do not disable discovery merely because the workflow contains a consequential action.

`disable-model-invocation` in YAML frontmatter is a Claude Code convention, not the source of Codex policy. An invocation policy is also not a filesystem access rule: authorized work can read a referenced file, including a `SKILL.md`, without treating it as a new autonomous task. Shared reference can live in a plain file with a conditional pointer from each caller.

## Splitting by invocation

Split off a skill when it has a distinct task and useful independent discovery. A shared reference alone does not need to become another skill. Use conditional file pointers when the material only supports an existing workflow.

## Router skills

When many user-invoked skills are hard to remember, a **router skill** can name the relevant choices and explain when each applies. A router used for advice should recommend the next skill. When the user has already authorized the underlying workflow, apply relevant installed guidance without inventing an extra confirmation gate; retain the destination skill's scope and action boundaries.
