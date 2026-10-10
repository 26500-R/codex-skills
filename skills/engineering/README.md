# Engineering

Codex skills from the promoted set. See the [fork README](../../README.md) for installation and upstream synchronization.


## User-invoked

- **[ask-matt](./ask-matt/SKILL.md)**: Ask which skill or flow fits your situation. A router over the skills in this repo.
- **[grill-with-docs](./grill-with-docs/SKILL.md)**: A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go.
- **[implement](./implement/SKILL.md)**: Implement a piece of work based on a spec or set of tickets.
- **[implement-spec](./implement-spec/SKILL.md)**: Implement the result of $to-spec and $to-tickets in code.
- **[improve-codebase-architecture](./improve-codebase-architecture/SKILL.md)**: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
- **[retro](./retro/SKILL.md)**: Conduct a retrospective on a coding session.
- **[setup-matt-pocock-skills](./setup-matt-pocock-skills/SKILL.md)**: Configure persistent repository conventions for the engineering skills: issue tracker, triage labels, and domain docs, recorded in AGENTS.md and referenced files.
- **[to-spec](./to-spec/SKILL.md)**: Turn the current conversation into a spec and publish it to the project issue tracker: no interview, just synthesis of what you've already discussed.
- **[to-tickets](./to-tickets/SKILL.md)**: Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocking edges, published to the configured tracker (edges as text in one file per ticket locally, or native blocking links on a real tracker).
- **[triage](./triage/SKILL.md)**: Move issues and external PRs through a state machine of triage roles, categorise, verify, grill if needed, and write agent-ready briefs.
- **[wayfinder](./wayfinder/SKILL.md)**: Plan a huge chunk of work (more than one agent session can hold) as a shared map of decision tickets on your issue tracker, and resolve them one at a time until the way to the destination is clear.

## Model-invoked

- **[code-review](./code-review/SKILL.md)**: Review a branch, PR, specified commit range, or uncommitted changes for correctness, documented standards, and requirements. Use when the user requests a code review.
- **[codebase-design](./codebase-design/SKILL.md)**: Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find deepening opportunities, decide where a seam goes, make code more testable or AI-navigable, or when another skill needs the deep-module vocabulary.
- **[diagnosing-bugs](./diagnosing-bugs/SKILL.md)**: Diagnose hard bugs, intermittent failures, or measured performance regressions when the cause is unclear and systematic investigation is needed. Routine error explanations and obvious local fixes do not require this workflow.
- **[domain-modeling](./domain-modeling/SKILL.md)**: Build and sharpen a project's domain model. Use when discussing codebase terminology, writing or editing a GLOSSARY.md, or recording or editing an ADR.
- **[pr](./pr/SKILL.md)**: Write a pull request title and body grounded in the final diff, the repository's template, and actual validation results.
- **[prototype](./prototype/SKILL.md)**: Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right, or explore what a UI should look like.
- **[research](./research/SKILL.md)**: Investigate a substantive research question using primary sources, or perform explicitly delegated research. Use for evidence gathering and synthesis beyond a routine factual lookup.
- **[tdd](./tdd/SKILL.md)**: Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor", or wants integration tests.
- **[wizard](./wizard/SKILL.md)**: Generate an interactive PowerShell or Bash wizard for a multi-step procedure that requires human input, such as credential setup or a manual cutover. Do not use for steps Codex can complete directly.
