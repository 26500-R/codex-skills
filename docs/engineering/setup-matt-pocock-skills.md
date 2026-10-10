## What it does

`setup-matt-pocock-skills` records persistent repository conventions for the issue tracker, triage labels, and domain docs. The configuration lives under `docs/agents/`, reached through the effective Codex `AGENTS.md` instructions.

It reuses conventions and answers already present, asking only about unresolved material choices. Standalone review, debugging, and local implementation do not need this setup.

## When to reach for it

Invoke `$setup-matt-pocock-skills`; it is not selected automatically. Use it when several skills should share tracker or documentation conventions, or when those conventions need to change. An explicit issue URL or local spec is enough for many one-off tasks.

## Prerequisites

The workspace must allow the requested repository edits. Tracker label creation also needs the appropriate tracker access and must be within the requested setup scope.

| Output | Location |
| --- | --- |
| Issue tracker instructions | `docs/agents/issue-tracker.md` |
| Domain-doc conventions | `docs/agents/domain.md` |
| Triage role mapping, when triage is installed | `docs/agents/triage-labels.md` |
| Pointers to these files | The effective `AGENTS.md`, override, or explicitly referenced canonical file |

## The configuration choices

| Choice | Default approach |
| --- | --- |
| Tracker | Reuse an established tracker; otherwise propose the remote's platform or local markdown |
| Labels | Reuse clear existing labels, or the five state roles plus `bug` and `enhancement` |
| Domain docs | Reuse the existing layout; otherwise a root glossary and ADR directory suit a single-context repo |

GitHub, GitLab, and local markdown have seed templates. Other trackers use the workflow you describe. The output is ordinary markdown you can inspect and edit; setup does not rewrite the installed skills.

## Common questions

**What if this repo has `CLAUDE.md` but no `AGENTS.md`?**

The skill creates `AGENTS.md` for Codex and preserves the existing file. If `AGENTS.override.md` supersedes the normal instructions, the pointers go in that effective file or its referenced canonical source. It does not assume a file is active just because it exists.

**Does it create tracker labels?**

For authorized GitHub or GitLab setup, it creates missing configured labels. A local-only or draft-only request remains local. Existing label meanings are preserved; ambiguity is resolved before changing the mapping.

**Must I confirm every section?**

No. Existing configuration, explicit preferences, and prior authorization are reused. Only a material unresolved choice needs an answer.

**Where do communication preferences belong?**

In your effective `AGENTS.md` or the invocation. This setup configures tracker and domain-doc conventions, not general tone or a universal engineering pipeline.

**When should I rerun it?**

When the tracker or layout changes, or a template update matters to your workflow. Routine edits can be made directly in `docs/agents/`.

## It's working if

- The pointers are in a Codex instruction file that is actually read.
- Tracker and label choices match existing repository conventions.
- The requested configuration is created without repeated confirmations.
- Standalone work remains usable without setup.
- No installed `SKILL.md` is changed by the setup run.

## Where it fits

This is optional repository configuration, not a prerequisite for every engineering task. [triage](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/triage.md), [to-spec](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-spec.md), [to-tickets](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/to-tickets.md), and [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) can reuse its tracker instructions. [domain-modeling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/domain-modeling.md) uses the domain-doc layout when records are requested or established by the repository workflow. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) is the router over the set.
