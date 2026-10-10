---
name: code-review
description: Review a branch, PR, specified commit range, or uncommitted changes for correctness, documented standards, and requirements. Use when the user requests a code review.
---

Review the requested changes through three lenses:

- **Correctness**: bugs, regressions, and broken invariants introduced by the change.
- **Standards**: the repo's documented conventions and constraints.
- **Spec**: the user's request and any originating issue or specification.

## Process

### 1. Establish the review scope

Read the user's request and `git status --short` before choosing a diff. Honor an explicit scope; do not silently substitute committed changes for work in progress.

| Requested scope | Comparison |
| --- | --- |
| Branch or PR | Resolve its actual base and head. Compare the merge-base to the requested head, for example `git diff <base>...<head>`. |
| Changes since an exact commit or tag | Compare that commit directly to the requested endpoint, for example `git diff <commit> HEAD`. Use a merge-base only if the request calls for branch divergence. |
| All uncommitted changes | Use `git diff HEAD` for the combined tracked result, and read relevant untracked files from `git ls-files --others --exclude-standard`. |
| Staged only | Use `git diff --cached`; inspect content from the index, since the working copy may differ. |
| Unstaged only | Use `git diff`; include untracked files only if they are part of the requested work. |
| Branch plus work in progress | Compare the resolved merge-base to the working tree, and include relevant untracked files. |

If a repository has no `HEAD` yet, inspect the index and relevant untracked files instead of using a `HEAD` comparison. Use `git diff --cached` for the initial index and `git diff` for subsequent unstaged edits.

Resolve refs with `git rev-parse --verify <ref>^{commit}` and record the base, endpoint, path filters, and included change states. For a PR, ensure the checkout or fetched content matches the PR's head. Infer a missing base from reliable PR or repository metadata; ask only when materially different interpretations remain. If the selected scope is empty, report that without launching reviewers.

### 2. Gather requirements and standards

Use an explicitly supplied requirement or spec first, then relevant issue references, commit messages, and nearby spec files. The conversation can supply the requirements. If none exists, say so and continue correctness and standards review; do not invent a spec or require tracker setup for a local review.

Read applicable `AGENTS.md`, `CODING_STANDARDS.md`, `CONTRIBUTING.md`, and relevant design decisions. Existing repository conventions take precedence over generic design preferences.

Code smells such as duplicated logic, speculative abstraction, or scattered responsibilities are leads to investigate, not automatic findings. Report them only when the changed code causes a concrete correctness, maintenance, or documented-standards problem. Skip mechanical style checks already enforced by tooling.

### 3. Review the selected state

Read surrounding code and call sites, not only diff hunks. Trace relevant inputs, failure paths, and interactions. Use targeted tests or a minimal reproduction where they materially verify a finding. Review does not authorize editing the implementation.

For a substantial change, use available Codex subagent tools to split independent correctness, standards, or spec checks. A small change can be reviewed directly. Give every reviewer the same resolved scope, relevant sources, and this instruction:

> Review directly. Do not invoke this skill or delegate again. Return actionable findings with the affected path and line, triggering conditions, impact, and supporting evidence. Separate demonstrated defects from unverified possibilities.

When tools or agent capacity are unavailable, perform the checks sequentially. No lens requires a separate agent to be useful.

### 4. Verify and report

Re-check candidate findings against the selected file state and requirements. Discard unsupported claims, pre-existing problems outside the scope, and subjective preferences with no material impact. Deduplicate overlapping findings and rank them together by severity, retaining correctness, standards, or spec labels where useful.

For each finding, give a concise title, a precise location, the conditions that trigger it, and why it matters. Cite the rule or requirement for a standards or spec finding. Put actionable findings first; then state the scope reviewed, validation performed, and material limits such as missing requirements or tests that could not run. If there are no supported findings, say so without implying exhaustive proof of correctness.
