## What it does

`teach` supports focused explanations and continuing study. When you request a course or reusable lessons, it uses a teaching workspace across [sessions](https://www.aihero.dev/ai-coding-dictionary/session), with short HTML lessons and learning records. A one-off explanation stays in the conversation.

It verifies specialized, uncertain, consequential, or changing claims against trustworthy sources, while explaining established concepts directly when appropriate. In course mode it records sources in `RESOURCES.md` and keeps the mission, lessons, and learning record in files. This [stateful](https://www.aihero.dev/ai-coding-dictionary/stateful) mode lets a later session continue from the workspace.

## When to reach for it

You invoke this by typing `$teach`; the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) won't reach for it on its own.

Reach for it when the learning is the project: a language, a framework, a codebase you have just joined, yoga, shaders, a certification. You can also request a single explanation without creating course files.

| What you want | What to reach for |
| --- | --- |
| To learn a topic over weeks, with sessions that accumulate | `teach` |
| One idea explained inside the session you are already in | Just ask, in that session |
| The agent's last message re-pitched because it didn't land | [wait-what](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/wait-what.md) |
| To sharpen thinking you already have, rather than acquire new material | [grill-me](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/grill-me.md) |
| A background agent to read [primary sources](https://www.aihero.dev/ai-coding-dictionary/primary-source) and leave you a cited document | [research](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/research.md) |
| To learn something that came up mid-grilling, without derailing the [grilling](https://www.aihero.dev/ai-coding-dictionary/grilling) | [handoff](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/handoff.md) out to a teaching workspace, then `teach` there |

## Prerequisites

Course mode needs a teaching directory where the requested lesson files can be saved. A dedicated folder is useful for a topic you will study over multiple sessions; use the location you choose. One-off explanations need no workspace.

What accumulates in that directory:

| Path | What it holds |
| --- | --- |
| `MISSION.md` | Why you are learning this. Every other file depends on it. Goals already supplied can populate it; questions are only needed where the answer changes the lesson |
| `RESOURCES.md` | The vetted sources it teaches from, split into Knowledge and Wisdom (communities) |
| `lessons/*.html` | The numbered lessons: the primary unit of teaching |
| `reference/*.html` | Compressed cheat-sheets, algorithms, glossaries: the documents you return to |
| `learning-records/*.md` | ADR-style notes on what you have demonstrably learned, used to decide what to teach next |
| `assets/*` | Reusable components, starting with a shared stylesheet, so the lessons look like one course |
| `NOTES.md` | Your stated teaching preferences |

Two notes on that list. A glossary suits most topics, but the skill ships a `GLOSSARY-FORMAT.md` that `SKILL.md` no longer links to, so you only get one if you ask ([issue #559](https://github.com/mattpocock/skills/issues/559)). Course artifacts land in the designated teaching directory, or the current directory when that is the requested workspace.

## Storage strength, not fluency

The word to think with is **storage strength**: long-term retention, as opposed to **fluency**, the in-the-moment recall that feels like mastery while you are reading and is gone a week later. `teach` builds the former through desirable difficulty: retrieval practice, spacing, interleaving. Knowledge comes first. At that stage difficulty works against you, because it uses up the working memory you need to understand. Then `teach` drills the skill through a tight feedback loop, and at that stage difficulty is the tool.

Two things decide what you get taught. The **mission** (the concrete real-world reason you want this) is the basis of every lesson. Without it the lessons become abstract and nothing decides what comes next. From the mission and the learning records, `teach` picks the next lesson inside your **zone of proximal development**: hard enough to take effort, but not so far ahead that you cannot learn it.

A question that needs **wisdom** (real-world judgement) may benefit from a community where you can test it. Exercises support learning, but you can skip one, change the lesson, or stop.

## Lessons, references and components

A **lesson** is one self-contained HTML file, short enough to finish in a sitting, tied to the mission, giving one tangible win. It cites its sources, recommends one primary source to go and read yourself, and links to sibling lessons and reference documents.

You rarely go back to a lesson, but you do go back to reference documents. So the short form of a lesson (the syntax table, the algorithm, the pose sequence, the glossary) belongs in `reference/`, not buried in the lesson that introduced it.

Course lessons reuse suitable **components** in `assets/`: stylesheets, quiz widgets, simulators, and diagram helpers. New shared components are extracted when reuse is actually needed. Multiple HTML lessons share a stylesheet; a single explanation does not need a component library.

## Common questions

**Where does it put the files? Mine ended up in `~/.claude/skills`.**
In the designated teaching directory, or the current directory when that is the requested workspace. Skill resources remain in the installed skill folder ([upstream issue #377](https://github.com/mattpocock/skills/issues/377)).

**Do I stay in one session, or start a new one per lesson?**
All three approaches work: staying in the same session, re-invoking `$teach` in a new session, or opening a new session in the same folder. Each lesson is its own invocation. The course state lives in the folder, not in the conversation. Common practice is to open a fresh session in the workspace and say `$teach next lesson for <topic>`.

**How do I know it isn't teaching me something it made up?**
You don't, on the skill's word alone. You read the primary sources. `teach` is not reliable enough to trust unchecked, and no skill built on an LLM is. The grounding (`RESOURCES.md`, citations in every lesson, one recommended primary source per lesson) makes it cheap to check a lesson. It does not remove the need to check. This failure has happened: one user learning a 2x2 Rubik's cube got made-up move sequences that don't solve it. In a case like that, check the model, the harness, the effort setting, and the source. Risk is highest in procedural domains with precise notation, and lowest where the output is immediately verifiable, like code you can run.

**The correct quiz answer is always the first option.**
Correct answers should vary in position, and distractors should be plausible and comparable in detail. Exact word counts do not ensure a fair quiz. For interactive quizzes, answer shuffling can prevent predictable positions; this addresses the failure discussed in [upstream issue #335](https://github.com/mattpocock/skills/issues/335).

**It assumed I already knew things, and used terms it never defined.**
The skill uses your supplied goals, prior knowledge, and learning records. When a missing detail would change the lesson, it asks rather than assuming. State your gaps or correct the level when needed; course learning records can preserve that correction. Starting-level assumptions were raised in [upstream issue #725](https://github.com/mattpocock/skills/issues/725).

**Does it do spaced repetition, and does it know when to stop teaching?**
No to the first, and not reliably to the second. The skill designs lessons around spacing and interleaving, but nothing schedules a review, and there is no Anki or calendar integration. Users ask for both often. A related gap is exit criteria. As one user put it, `teach` "is good at making the next lesson, but not as good at knowing when to stop and switch to review or real practice." If you want review or drilling instead of new material, ask for it; the skill will not propose the switch on its own.

**Is it only useful for code?**
No. Most reported use is outside coding: Korean, Japanese formal register, piano, guitar, board game design, OpenSCAD, film plots, Azure and CCNA certifications, university exams, and children of eight and ten getting printable books on escape rooms and fire salamanders. Nothing in the skill is specific to programming. Mission, resources, zone of proximal development and drill work the same way in any domain. Within code, users report the most value from getting oriented in an unfamiliar codebase or a new team's stack, more than from learning a language from scratch.

**Which model should I run it with?**
Use a Codex model suitable for the topic and check the actual lesson: correct content, appropriate level, and useful practice matter more than length. A model or [reasoning effort](https://www.aihero.dev/ai-coding-dictionary/effort) change may help, but it does not replace source verification for precise procedures.

## It's working if

- The teaching format matches your request: an explanation stays in chat; a course persists its state.
- It uses goals and prior knowledge already supplied, asking only where the answer changes the lesson.
- Specialized or uncertain claims have sources you can check, and course lessons recommend further reading.
- A lesson takes one sitting and leaves you able to do one thing you couldn't before.
- Opening a fresh session in the folder and saying "next lesson" continues the course instead of restarting it.
- `learning-records/` grows, and lessons stop re-teaching what you have already demonstrated.
- The lessons look like one course: they link the stylesheet in `assets/` rather than each carrying its own.
- A question that needs judgement gets you pointed at a forum, subreddit or class, not just an answer.

## Where it fits

`teach` is a **reach-for-it-anytime standalone**. It is not a step in a build chain and shares no artifacts with the engineering flow; it works in its own directory for as long as you study the topic.

Its one real neighbour is [handoff](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/productivity/handoff.md). Together they answer "what do I do if I'm being grilled about something I don't understand?" Don't stop the grilling to learn. `$handoff` to a teaching workspace, learn the topic there with `$teach`, then go back and continue where you left off. The nearby alternative is [research](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/research.md), for when what you want is a cited document rather than lessons and retention. When you are not sure which skill or flow fits, [ask-matt](https://github.com/26500-R/codex-skills/blob/codex/adaptation/docs/engineering/ask-matt.md) routes you over the whole set.
