# Codex invocation

Every promoted skill has `SKILL.md` and `agents/openai.yaml`.

- **User-invoked** skills set `policy.allow_implicit_invocation: false` in `agents/openai.yaml`. Invoke them explicitly with `$skill-name` or a clear request. Do not route into a new manual workflow merely because another skill mentions it.
- **Model-invoked** skills may be selected when their description matches the task. Keep descriptions specific enough to distinguish adjacent workflows.

`disable-model-invocation` is Claude-specific metadata, not Codex's invocation control. This Codex branch omits it from adapted skills and preserves the existing policy in `agents/openai.yaml`.

When a workflow needs another skill, locate and read that skill's `SKILL.md` using the current session's catalog, then follow the relevant instructions. Use tools actually exposed in the session; there is no universal `Skill` tool. Read supporting files only as needed. If a dependency is unavailable, state the limitation and continue the parts supported by the available tools.

Reading `GLOSSARY.md` for vocabulary is not itself a request to create a glossary or record ADRs. Apply `domain-modeling` when the task involves actively clarifying or changing the model, and persist documentation when the requested work calls for it.
