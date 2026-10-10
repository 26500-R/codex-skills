## What it does

`improve-codebase-architecture` surveys a codebase for **deepening opportunities**: places where a module could hide more complexity behind a smaller, clearer interface. It presents evidence-backed candidates in an HTML report with before-and-after diagrams.

A survey does not authorize a refactor. The next design discussion follows a candidate you select, unless your request already identified the candidate and asked for that work. The skill can conclude that no improvement is worth pursuing.

## When to reach for it

Invoke `$improve-codebase-architecture`; it is not selected automatically.

| Situation | Use |
| --- | --- |
| You want architectural friction and candidate improvements identified | `$improve-codebase-architecture` |
| You already chose a module and need interface design guidance | [codebase-design](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/codebase-design.md) |
| A concrete bug needs diagnosis | [diagnosing-bugs](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/diagnosing-bugs.md) |
| A large uncertain effort needs a decision map | [wayfinder](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/wayfinder.md) |

## Prerequisites

No setup is required. Existing glossary terms and relevant ADRs inform the survey. Codex uses an available subagent for useful independent exploration, or inspects directly when delegation is unavailable.

The report is saved to a permitted temporary location and opened through an available preview. Domain records are updated only when requested or established by repository conventions.

## Depth and evidence

The **deletion test** asks whether removing a shallow module would concentrate complexity behind a better interface or merely spread it among callers. A worthwhile candidate explains the observed friction, the proposed change, and the effect on testability and locality.

Without a specified area, recent commit history helps focus on frequently changed paths. Each report card names the affected files, evidence, solution, expected benefit, before-and-after structure, and recommendation strength. Domain names and existing architecture terms are preserved; the skill's vocabulary is an analytical aid, not a rename mandate.

## Common questions

**Can I ask for only the report?**

Yes. A report-only request ends with the report. An interview is useful when the selected candidate has unresolved design decisions; it is not an unavoidable phase of every survey.

**Does it require Claude Code's Agent tool?**

No. It uses available Codex subagent tools or direct inspection. A missing delegation capability does not block the survey.

**The report has no styles or diagrams offline.**

CDN-backed Tailwind or Mermaid needs network access. A report intended to work offline uses inline CSS and SVG. The report should be checked in the environment where the user will view it.

**Can it say the codebase is fine?**

Yes. A report should not manufacture work to populate its cards. Speculative candidates should be labeled as such, and none may justify a refactor now.

**Will it write a glossary or ADR for every finding?**

No. Records need a requested or established documentation workflow. A rejected candidate warrants an ADR only when its lasting rationale will matter to future decisions.

## It's working if

- Candidates point to actual friction in relevant code.
- Benefits explain simpler interfaces, locality, or meaningful tests.
- The report respects project terminology and existing decisions.
- A survey request produces a report without changing production code.
- No further interview is imposed when you asked for the report only.

## Where it fits

This is a standalone architecture survey. [codebase-design](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/codebase-design.md) supplies the depth-and-seam concepts, [grilling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grilling.md) helps resolve a selected design's open questions, and [domain-modeling](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/domain-modeling.md) supports requested domain records. [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) maps these skills to the wider workflow.
