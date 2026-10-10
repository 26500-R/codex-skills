# Writing Codex skill docs

Each promoted skill has a human-facing page at `docs/<bucket>/<skill-name>.md`. Keep it in sync when behavior, names, or invocation policy changes. Pages explain when and why to use a skill; they do not duplicate its runbook.

Use this order:

1. `## What it does`: state the job and defining constraint.
2. `## When to reach for it`: state the trigger boundary and explicit/implicit invocation mode. Use Codex `$skill-name` syntax.
3. Optional prerequisites and one to three sections explaining the skill's distinctive method.
4. `## Common questions`: answer concrete user questions or likely confusion. Do not fabricate observed questions or pad the count.
5. `## It's working if`: give outcomes a user can recognize without auditing the instructions.
6. `## Where it fits`: explain relevant neighbors and link to `ask-matt` when useful.

Link to adapted pages using `https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/<bucket>/<name>.md`. Link external sources only for claims they support. These fork pages are not published on aihero.dev. Keep installation commands in the root README, and maintain the bucket and root skill catalogs when descriptions change.

Use plain language, avoid em dashes, and preserve existing project vocabulary. Do not add mandatory interviews, documentation, approvals, or cross-skill chains merely to make the docs conform to a template.
