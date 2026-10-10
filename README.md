# Codex Skills

A Codex-focused adaptation of [Matt Pocock's skills](https://github.com/mattpocock/skills), maintained in [26500-R/codex-skills](https://github.com/26500-R/codex-skills/tree/codex/adaptation). Original work remains under its [MIT license](LICENSE).

The supported set contains 27 skills from `engineering` and `productivity`. This fork keeps their useful engineering practices while adapting skill lookup, tools, language, and workflow scope to Codex. Other upstream buckets and Claude packaging remain for upstream merge compatibility; the installer does not install them.

## Install in Codex

```powershell
git clone --branch codex/adaptation https://github.com/26500-R/codex-skills.git
cd codex-skills
./scripts/install-codex.ps1
```

Run the script with PowerShell. It installs only the promoted skill directories into `$CODEX_HOME/skills`, defaulting to `~/.codex/skills`. Use `-Destination <path>` for another location. Existing copies are moved to a timestamped sibling `skill-backups` directory before replacement; other skill names are left alone. Start a new Codex chat to reload the catalog.

Do not install the upstream plugin alongside these copies. These editable files update when you rerun the installer, not automatically. The legacy upstream linking and marketplace commands are not the installation route for this adaptation.

Invoke a skill explicitly with `$skill-name`. The existing policies are preserved: 16 skills require explicit invocation and 11 may be selected automatically when their trigger fits. The optional `$setup-matt-pocock-skills` configures tracker and documentation conventions for a project; standalone review, debugging, and TDD do not require it.

## Sync changes from Matt Pocock

`main` is kept as an unmodified upstream reference. `codex/adaptation` contains the Codex changes and is the branch to install. Register the upstream remote once:

```powershell
git remote add upstream https://github.com/mattpocock/skills.git
```

From a clean working tree, bring upstream changes into the adaptation:

```powershell
git fetch origin
git switch codex/adaptation
git pull --ff-only origin codex/adaptation
git fetch upstream
git merge upstream/main
```

If Git reports conflicts, reconcile the changed instructions while preserving Codex behavior, then `git add` the resolved files and `git merge --continue`. Review newly added, removed, or renamed skills, invocation policies, and supporting references. Check the diff, validate the affected skills, and exercise changed workflows before publishing and installing:

```powershell
git push origin codex/adaptation
./scripts/install-codex.ps1
```

GitHub's **Sync fork** on `main` updates the upstream reference only. It does not update `codex/adaptation` or local installed copies. Merging preserves adaptation history; a force sync or hard reset can discard it. Conflict-free Git merges still need behavioral review because upstream workflow changes may conflict in meaning. Nothing here schedules automatic synchronization.

The installer replaces current promoted names only. If upstream removes or renames a skill, archive the retired local directory after review; the script does not delete names absent from its source tree.

## Skill catalog

Human-facing pages live in `docs/engineering` and `docs/productivity`. Codex execution policy lives in each skill's `agents/openai.yaml`.


### Engineering


**User-invoked**

- **[ask-matt](skills/engineering/ask-matt/SKILL.md)**: Ask which skill or flow fits your situation. A router over the skills in this repo.
- **[grill-with-docs](skills/engineering/grill-with-docs/SKILL.md)**: A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go.
- **[implement](skills/engineering/implement/SKILL.md)**: Implement a piece of work based on a spec or set of tickets.
- **[implement-spec](skills/engineering/implement-spec/SKILL.md)**: Implement the result of $to-spec and $to-tickets in code.
- **[improve-codebase-architecture](skills/engineering/improve-codebase-architecture/SKILL.md)**: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
- **[retro](skills/engineering/retro/SKILL.md)**: Conduct a retrospective on a coding session.
- **[setup-matt-pocock-skills](skills/engineering/setup-matt-pocock-skills/SKILL.md)**: Configure persistent repository conventions for the engineering skills: issue tracker, triage labels, and domain docs, recorded in AGENTS.md and referenced files.
- **[to-spec](skills/engineering/to-spec/SKILL.md)**: Turn the current conversation into a spec and publish it to the project issue tracker: no interview, just synthesis of what you've already discussed.
- **[to-tickets](skills/engineering/to-tickets/SKILL.md)**: Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocking edges, published to the configured tracker (edges as text in one file per ticket locally, or native blocking links on a real tracker).
- **[triage](skills/engineering/triage/SKILL.md)**: Move issues and external PRs through a state machine of triage roles, categorise, verify, grill if needed, and write agent-ready briefs.
- **[wayfinder](skills/engineering/wayfinder/SKILL.md)**: Plan a huge chunk of work (more than one agent session can hold) as a shared map of decision tickets on your issue tracker, and resolve them one at a time until the way to the destination is clear.

**Model-invoked**

- **[code-review](skills/engineering/code-review/SKILL.md)**: Review a branch, PR, specified commit range, or uncommitted changes for correctness, documented standards, and requirements. Use when the user requests a code review.
- **[codebase-design](skills/engineering/codebase-design/SKILL.md)**: Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find deepening opportunities, decide where a seam goes, make code more testable or AI-navigable, or when another skill needs the deep-module vocabulary.
- **[diagnosing-bugs](skills/engineering/diagnosing-bugs/SKILL.md)**: Diagnose hard bugs, intermittent failures, or measured performance regressions when the cause is unclear and systematic investigation is needed. Routine error explanations and obvious local fixes do not require this workflow.
- **[domain-modeling](skills/engineering/domain-modeling/SKILL.md)**: Build and sharpen a project's domain model. Use when discussing codebase terminology, writing or editing a GLOSSARY.md, or recording or editing an ADR.
- **[pr](skills/engineering/pr/SKILL.md)**: Write a pull request title and body grounded in the final diff, the repository's template, and actual validation results.
- **[prototype](skills/engineering/prototype/SKILL.md)**: Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right, or explore what a UI should look like.
- **[research](skills/engineering/research/SKILL.md)**: Investigate a substantive research question using primary sources, or perform explicitly delegated research. Use for evidence gathering and synthesis beyond a routine factual lookup.
- **[tdd](skills/engineering/tdd/SKILL.md)**: Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor", or wants integration tests.
- **[wizard](skills/engineering/wizard/SKILL.md)**: Generate an interactive PowerShell or Bash wizard for a multi-step procedure that requires human input, such as credential setup or a manual cutover. Do not use for steps Codex can complete directly.

### Productivity


**User-invoked**

- **[grill-me](skills/productivity/grill-me/SKILL.md)**: A relentless interview to sharpen a plan or design.
- **[handoff](skills/productivity/handoff/SKILL.md)**: Compact the current conversation into a handoff document for another agent to pick up.
- **[teach](skills/productivity/teach/SKILL.md)**: Teach the user a new skill or concept, within this workspace.
- **[to-questionnaire](skills/productivity/to-questionnaire/SKILL.md)**: Turn a decision you can't fully answer into a questionnaire for someone else to fill in.
- **[wait-what](skills/productivity/wait-what/SKILL.md)**: Stop. That last message did not land: re-pitch it.

**Model-invoked**

- **[grilling](skills/productivity/grilling/SKILL.md)**: Stress-test a plan, decision, or idea through a focused interview when the user asks to be grilled or to examine their assumptions.
- **[writing-for-agents](skills/productivity/writing-for-agents/SKILL.md)**: Writing documents for agents. Use when creating or editing skills, or modifying AGENTS.md or CLAUDE.md.
