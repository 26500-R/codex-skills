---
name: improve-codebase-architecture
description: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
---

# Improve Codebase Architecture

Surface architectural friction and propose **deepening opportunities**: refactors that turn shallow modules into deep ones. The aim is testability and AI-navigability.

This command is _informed_ by the project's domain model and built on a shared design vocabulary:

- Read the installed `codebase-design/SKILL.md` for the architecture vocabulary (**module**, **interface**, **depth**, **seam**, **adapter**, **leverage**, **locality**) and its principles. Use those concepts precisely while preserving the project's established names, including terms such as service, component, or API when they are accurate.
- The domain language in `GLOSSARY.md` gives names to good seams; ADRs in `docs/adr/` record decisions this command should not re-litigate.

## Process

### 1. Explore

**Scope before you scan: YAGNI.** Deepening a module pays off by making future changes to it easier, so put extra weight on the parts of the codebase that have recently changed. Decide *where* to look before you look:

- If the user named a direction (a module, a subsystem, a pain point), take it, and skip the inference below.
- Otherwise, walk back a good stretch of the commit history (`git log --oneline`) to find the codebase's hot spots, the files and areas that keep coming up, and let those paths pull your attention first. If the changes are scattered with no clear hot spot, widen the net.

Read the project's domain glossary (`GLOSSARY.md`) and any ADRs in the area you're touching first.

Use an available Codex subagent for independent exploration when it helps; otherwise inspect directly. Note concrete friction:

- Where does understanding one concept require bouncing between many small modules?
- Where are modules **shallow**, with an interface nearly as complex as the implementation?
- Where have pure functions been extracted just for testability, but the real bugs hide in how they're called (no **locality**)?
- Where do tightly-coupled modules leak across their seams?
- Which parts of the codebase are untested, or hard to test through their current interface?

Apply the **deletion test** to anything you suspect is shallow: would deleting it concentrate complexity, or just move it? A "yes, concentrates" is the signal you want.

### 2. Present candidates as an HTML report

Write the HTML report to a permitted OS temp directory so nothing lands in the repo. Use the current environment's temp-directory mechanism, such as `[IO.Path]::GetTempPath()` in PowerShell, and write `<tmpdir>/architecture-review-<timestamp>.html`. Open it with an available Codex file or browser preview tool, or the platform's file-opening command, and provide the absolute path.

Use **Tailwind** and **Mermaid** when available and useful for layout or structural diagrams. A report that must work offline should use inline CSS and SVG instead of CDN dependencies. Each candidate gets a **before/after visualisation** that communicates the proposed structural change.

For each candidate, render a card with:

- **Files**: which files/modules are involved
- **Problem**: why the current architecture is causing friction
- **Solution**: plain English description of what would change
- **Benefits**: explained in terms of locality and leverage, and how tests would improve
- **Before / After diagram**: side-by-side, custom-drawn, illustrating the shallowness and the deepening
- **Recommendation strength**: one of `Strong`, `Worth exploring`, `Speculative`, rendered as a badge

End the report with a **Top recommendation** section: which candidate you'd tackle first and why.

**Use existing domain vocabulary and precise architecture concepts.** If `GLOSSARY.md` defines "Order," name that concept rather than inventing a generic class name. Preserve an established term such as "Order service" when it accurately identifies the code being discussed.

**ADR conflicts**: if a candidate contradicts an existing ADR, only surface it when the friction is real enough to warrant revisiting the ADR. Mark it clearly in the card (e.g. a warning callout: _"contradicts ADR-0007, but worth reopening because…"_). Don't list every theoretical refactor an ADR forbids.

See [HTML-REPORT.md](HTML-REPORT.md) for the full HTML scaffold, diagram patterns, and styling guidance.

For a survey request, stop after the report and let the user choose a candidate. If the user already selected a candidate or requested only the report, honor that scope. Report when no evidence-backed improvement is worth pursuing.

### 3. Grilling loop

For a selected candidate, read the installed `grilling/SKILL.md` when unresolved design decisions need an interview: constraints, dependencies, the shape of the deepened module, what sits behind the seam, what tests survive. Reuse decisions already made.

Read the installed `domain-modeling/SKILL.md` when the chosen workflow includes maintaining domain docs. Record terms and decisions only when requested or required by existing repository conventions:

- **Naming a deepened module after a concept not in `GLOSSARY.md`?** Add the term to `GLOSSARY.md`. Create the file lazily if it doesn't exist.
- **Sharpening a fuzzy term during the conversation?** Update `GLOSSARY.md` right there.
- **User rejects the candidate with a load-bearing reason?** Offer an ADR, framed as: _"Want me to record this as an ADR so future architecture reviews don't re-suggest it?"_ Only offer when the reason would actually be needed by a future explorer to avoid re-suggesting the same thing; skip ephemeral reasons ("not worth it right now") and self-evident ones.
- **Want to explore alternative interfaces for the deepened module?** Read the relevant interface guidance in `codebase-design/SKILL.md`; use independent subagents for alternatives when supported and useful.
