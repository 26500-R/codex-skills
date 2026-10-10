---
name: to-spec
description: "Turn the current conversation into a spec and publish it to the project issue tracker: no interview, just synthesis of what you've already discussed."
---

This skill takes the current conversation context and codebase understanding and produces a spec. Do NOT interview the user; just synthesize what you already know.

Use the destination and tracker conventions already supplied by the user or repository. If a publishing destination is unresolved, prepare the spec first and ask only for that missing choice; persistent tracker setup is optional for a one-off spec.

## Process

1. Explore the repo to understand the current state of the codebase, if you haven't already. Use the project's domain glossary vocabulary throughout the spec, and respect any ADRs in the area you're touching.

2. Record the seams at which the feature will be tested. Prefer existing public interfaces that exercise the required behavior. Add a seam only when the behavior cannot be tested reliably through the existing ones.

Reuse agreed testing decisions and project conventions. Flag a material unresolved interface choice without restarting the interview or blocking the rest of the draft.

3. Write the spec using the relevant sections below, then publish to the authorized destination. Respect a draft-only request. Apply the configured spec label; use `ready-for-agent` only if that label does not dispatch implementation of the whole parent spec automatically.

<spec-template>

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A concise list of distinct, agreed user outcomes. For user-facing features, a story can use this format:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

Cover the agreed scope and meaningful edge cases without inventing stories to fill the template. For refactors or infrastructure work, use behavior, interface, and invariant requirements instead.

## Implementation Decisions

A list of implementation decisions that were made. This can include:

- The modules that will be built/modified
- The interfaces of those modules that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- API contracts
- Specific interactions

Do NOT include specific file paths or code snippets. They may end up being outdated very quickly.

Exception: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it within the relevant decision and note briefly that it came from a prototype. Trim to the decision-rich parts, not a working demo, just the important bits.

## Testing Decisions

A list of testing decisions that were made. Include:

- The behavior and failure cases the tests must demonstrate
- Which modules will be tested
- Prior art for the tests (i.e. similar types of tests in the codebase)

## Out of Scope

A description of the things that are out of scope for this spec.

## Further Notes

Any further notes about the feature.

</spec-template>
