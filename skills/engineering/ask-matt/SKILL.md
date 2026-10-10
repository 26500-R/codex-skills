---
name: ask-matt
description: Ask which skill or flow fits your situation. A router over the skills in this repo.
---

# Ask Matt

Recommend a skill or a short route through this set for the user's situation. Routing alone does not authorize starting the recommended workflow; if the user already asked you to do the work, continue within that request.

Before stating what a skill does or recommending a step be skipped, read that skill's `SKILL.md`. Resolve it from the installed skills location or this repository's promoted buckets. Explicit-only skills may be absent from the automatic skill list; check their files before reporting them missing. In Codex, users invoke them with `$skill-name`; cooperating skills are loaded by reading their instructions, not by assuming a separate Skill tool exists.

## The main flow: idea → ship

A **flow** is a possible path, not a required chain. Enter at the step the user's current information and goal need. Reuse settled decisions; a clear implementation request does not need a new interview, spec, or ticket set.

1. **`$grill-with-docs`** sharpens an uncertain plan while maintaining relevant glossary terms and ADRs. Use **`$grill-me`** when the user wants the interview without writing those artifacts, including inside a repository. Both use **`$grilling`**.
2. If a question needs a runnable answer, **`$prototype`** builds a small artifact to settle it. Use **`$handoff`** when that work must travel to another workspace or session; a prototype does not require two handoff files by default.
3. Choose the build path:
   - For work that benefits from a durable decision record, **`$to-spec`** synthesizes what is already agreed. **`$to-tickets`** splits larger work into verifiable slices with blocking edges when that decomposition is useful.
   - **`$implement`** builds the selected ticket, spec, or agreed conversation. It applies **`$tdd`** where useful and **`$code-review`** to the completed task diff.
   - **`$implement-spec`** manages a whole ticket graph on one integration branch. It uses independent Codex subagents and worktrees where available, and serial execution where dependencies or available tools require it.
   - Use **`$tdd`** directly for a concrete behavior the user wants test-first, or **`$code-review`** directly for existing work. Neither needs the entire planning flow.
4. **`$pr`** shapes a pull request body to the change and repository conventions when the authorized task includes writing one.
5. **`$retro`** reviews a completed effort when the user wants lessons for the agent's environment: navigation, checks, coding standards, instructions, and tooling. It is optional, not automatic follow-on work.

### Context continuity

Preserve relevant decisions across planning, specs, and tickets. Continue in the current conversation while it remains useful; use the host's available context management only when needed. There is no fixed token threshold and no requirement to start a new session per ticket. Use **`$handoff`** for a durable transfer when the next session cannot otherwise access the necessary context.

## On-ramps

- **Raw bugs and requests** → **`$triage`**, which verifies reports and prepares actionable briefs or state recommendations. Already specified tickets do not need another triage pass.
- **A difficult bug or regression** → **`$diagnosing-bugs`**, which develops a tight feedback loop while using available code and logs to investigate. Lack of a runnable reproduction does not prohibit evidence-based analysis.
- **A large, uncertain effort** → **`$wayfinder`**, which charts a shared map of decision tickets. It plans by default and continues across ready decisions within the user's scope. When the map clears, `$to-spec` can consolidate decisions for a build; skip that extra artifact when the work is already adequately specified.

## Codebase health

**`$improve-codebase-architecture`** surveys architectural friction and presents deepening candidates. Use it for an architecture survey, then explore a selected candidate only as requested. **`$codebase-design`** supplies its deep-module concepts and can be consulted directly for an interface or seam question.

## Vocabulary underneath

- **`$domain-modeling`** sharpens domain language and, when requested or established by the repository workflow, maintains `GLOSSARY.md` and ADRs.
- **`$codebase-design`** supplies module, interface, depth, seam, adapter, leverage, and locality concepts while respecting existing project terminology.

## Phase boundaries

At a natural boundary, decide whether to continue, transfer context, delegate independent work, or use context management supported by the current Codex host. Read [PHASE-BOUNDARIES.md](PHASE-BOUNDARIES.md) when that choice is the user's question. Do not assume another host's slash commands or token limits apply.

## Standalone

- **`$grill-me`** is a stateless interview; **`$grilling`** is its underlying question-and-decision workflow.
- **`$prototype`** creates a focused artifact to answer a design question. Production changes and tracker updates depend on the user's request.
- **`$research`** investigates a question against primary sources, with delegation and a saved report when the requested work needs them.
- **`$to-questionnaire`** prepares questions for someone else's knowledge gap. Writing the questionnaire does not itself send it.
- **`$wizard`** guides steps only a human can perform, using a format and shell appropriate to their environment.
- **`$wait-what`** re-explains the preceding message at the level and in the language the user needs.
- **`$teach`** supports learning over multiple sessions with an agreed workspace.
- **`$writing-for-agents`** guides writing instructions that Codex consumes.
- **`$handoff`** writes a portable continuation artifact when work must move.

## Repository configuration

**`$setup-matt-pocock-skills`** records persistent tracker, label, and domain-doc conventions in the effective Codex `AGENTS.md` and referenced files. Use existing configuration or explicit task inputs first. Standalone review, debugging, and local work do not need setup.
