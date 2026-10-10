# Maintaining the Codex adaptation

This branch adapts Matt Pocock's promoted engineering and productivity skills for Codex. Keep upstream history and the MIT license. `main` tracks the unmodified upstream; make adaptations on `codex/adaptation` and merge `upstream/main` into that branch when updating.

- Ship only `skills/engineering/*/SKILL.md` and `skills/productivity/*/SKILL.md`. Leave unrelated skills and the user's global instructions alone.
- Prefer focused changes to triggers, tool portability, and workflow constraints. Preserve useful engineering discipline and the existing explicit/implicit invocation policy unless a requested behavior change needs otherwise.
- Codex uses `agents/openai.yaml` for invocation policy. See [.agents/invocation.md](.agents/invocation.md). Never assume a tool named `Skill` exists.
- When behavior changes, update its page under `docs/<bucket>/`, its bucket README, the root skill catalog, and `ask-matt` where routing changes. Follow [.agents/writing-docs.md](.agents/writing-docs.md), using this fork's documentation links and Codex `$skill-name` syntax.
- Installation and upstream synchronization are documented in [README.md](README.md). Keep [.agents/install-block.md](.agents/install-block.md) consistent. The inherited Claude manifests and release files are retained for merging upstream, not used by the Codex installation script.
- Validate frontmatter, `agents/openai.yaml`, local references, and the final diff. Exercise changed workflow behavior with a focused scenario when static checks cannot establish it. Do not claim runtime coverage of every skill from metadata checks.
- Do not overwrite or reset user work, copy machine-specific paths or credentials into this repo, or enable automated upstream merges without a request.
- Avoid em dashes in new prose.
