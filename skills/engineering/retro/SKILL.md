---
name: retro
description: "Conduct a retrospective on a coding session."
---

The user has asked for a **retrospective**. You are suggesting improvements to the coding agent's **environment** to improve future runs.

## Steps

1. Read and apply the installed `writing-for-agents` skill when evaluating or proposing instruction changes.

2. Read the primary sources for the session the user specifies. This may mean searching through session logs on this machine. If the user doesn't specify a session, default to the current one.

3. Look for candidates for improvement in these categories.

- **Navigation**: how easy was it for the agent to find the right files? Are there hidden dependencies between files? Would a **navigation pointer** make it easier? _Use when_ the session took a long time to find a piece of information.
- **Automated checks**: could an existing or proportionate new check have caught an observed error? Read the repo's own commands and CI first. Identify an unwired or broken check before proposing a replacement. Missing hooks or CI are not findings by themselves; connect the suggestion to a concrete failure, likely recurrence, and maintenance cost.
- **Coding standards**: should an existing rule be removed or clarified, or should a reviewer check a missed constraint? For a **mechanical** violation, consider a deterministic check in existing tooling. For a **judgement call**, consider focused prose in the existing standards. Recommend the smallest useful change; do not assume every mistake needs a permanent rule or new infrastructure.
- **Global AGENTS.md**: are there any steering instructions that should be moved to coding standards (or automated checks) instead? _Use when_ the AGENTS.md file is particularly large - in the repo OR the user's global scope.
- **Tool economy**: did the agent make expensive tool calls that could be streamlined? Is there any custom tooling (CLI's, MCP's) that is particularly token-inefficient? _Use when_ the agent made an expensive tool call.
- **No-ops**: look for instructions in steering files that don't modify the agent's behavior. _Use when_ the steering files are large and unwieldy.
- **Information access**: look for opportunities to increase the agent's access to information. Teeing dev server logs, readonly access to third-party services. _Use when_ a crucial piece of information was not available to the agent.

4. Present supported candidates in order of impact, with the observed evidence, expected benefit, and cost or uncertainty. Empty categories need no finding. This skill proposes changes; implement them only when the user has also requested that work.

## Reference

### Implementation vs Review

Implementation and review need different slices of context. Keep constraints that affect implementation discoverable before coding; use review to check the result independently. A reviewer may need surrounding code and requirements as well as a diff. Choose where guidance belongs based on when it is needed, not an assumed context advantage for one agent.

### Files

You have access to several files in the repo:

- `AGENTS.md`: Codex project instructions. Keep durable constraints and useful **navigation pointers** here. Treat `CLAUDE.md` as a separate host convention unless the repository explicitly points to it.
- `CODING_STANDARDS.md`, or the project's existing equivalent: read relevant standards during implementation and review. Move conditional detail to linked references when that improves discoverability; a line-count threshold alone does not justify a split.
- Docs: use docs as references files, pointed to by other files. Look for existing docs before writing new ones.
- Skills: use skills for docs (since their description goes into the agent's context window), or for user-invoked commands. Follow the advice in the `writing-for-agents` skill.
