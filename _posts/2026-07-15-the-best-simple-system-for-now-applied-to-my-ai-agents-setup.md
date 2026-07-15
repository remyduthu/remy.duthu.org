---
layout: post
title: The Best Simple System for Now, Applied to My AI Agents Setup
description: How generalizing my AI agent skills too early made them useless, and why building the smallest, most personal thing that solved my own shipping routine fixed it.
tags: [ai, claude-code, developer-experience, workflow]
---

I ship a lot of pull requests and the process to ship them barely changes shape from one to the next.
I pull the change into a worktree, split it into [commits that can each deploy on their own](https://en.wikipedia.org/wiki/Atomic_commit), review my own code, run the affected tests, push the stack, and watch the CI.
It's the kind of routine I stopped having to think about years ago, which is exactly why I assumed an AI agent could take it over.

Back in February I wrote a couple of [Claude Code skills](https://code.claude.com/docs/en/skills) to teach one how I ship, and they didn't help me so much.
The agent didn't use my own workflow.
Each PR added more feedback loops for me to close than I'd have had just doing the work myself.

## Where I went wrong

The honest answer is that I tried to build them for the wrong person.
I wrote those skills to be generic and reusable, with a vague plan to release them inside [Mergify](https://mergify.com/) someday, so I kept anything specific to me out of them.
That was the whole mistake.
The reason I wanted the skills at all was to capture how I work, and I'd sanded exactly that off to make them presentable to an audience who didn't exist yet.
What was left was general enough to apply anywhere and useless to the one person it was for.

<figure style="text-align: center;">
  <img src="/assets/images/overengineering.webp" alt="overengineering" style="max-width: 480px; margin: 0 auto;">
  <figcaption class="text-sm"><a href="https://www.reddit.com/r/ProgrammerHumor/comments/emlfkq/i_choked/">r/ProgrammerHumor</a></figcaption>
</figure>

I believed that shipping code was more or less the same everywhere.
The routine I find so repetitive is really only my own routine at Mergify, built from our [Stacks](https://docs.mergify.com/stacks/), our review process, our CI, and our conventions, and none of it transfers to your company or would want to.
A skill I can share has to drop the company-specific detail that made it worth having in the first place.
The day before I rewrote everything, I read [a blog post](https://dannorth.net/blog/best-simple-system-for-now/) written by Daniel Terhorst-North. 
He talks about the Best Simple System for Now (BSSN).
BSSN argues for building the simplest thing that solves the problem in front of you and deleting the rest.
My instinct runs the other way.
I tried to anticipate some future use before I've solved the one in front of me.

## The fix, and where it stands

What I built instead is a single skill I call [`/ship`](https://github.com/remyduthu/dotfiles/blob/main/modules/claude/skills/ship/SKILL.md), and its first property is that the agent can't choose to run it.
The frontmatter sets `disable-model-invocation: true`, so it only fires when I run it manually, usually with a [Linear](https://linear.app/) issue ID or a description of what I want to implement:

```
/ship MRGFY-XXX
```

That explicitness turned out to matter more than I expected because I know exactly when it runs, I can watch it misbehave, [fork](https://code.claude.com/docs/en/how-claude-code-works#resume-or-fork-sessions) a separate session at the step that went wrong, and have it refine the skill itself.
It's also told not to take the Linear issue on faith.
Indeed, one of its steps is to challenge the plan against the current code.
This step helps me because the code change rapidly and the initial idea may not be relevant anymore.

The instructions inside are deliberately over-specified.
They are rules that would look paranoid out of context: never `git push`, only `mergify stack push`; always work in a worktree; run `/code-review max --fix` and fold each fix into the commit it belongs to; watch CI until it finishes.
The weirdly specific lines are the ones that actually changed the agent's behavior.

`/ship` also leans on shared team skills (e.g. building, linting, testing practices, or even [a skill that runs read-only queries against our production database](https://mergify.com/blog/how-we-turned-claude-into-a-cross-system-support-investigator#production-database-read-only-but-powerful)).
`/ship` is just the thin personal glue on top.
It wires those general pieces together.

Both layers earn their place, and the one I'd been skipping was the personal one.
The thinking that comes before it, from the design down to writing the Linear issue, stays with me, because that's the part of the work that's actually different each time.

I won't pretend it's finished.
CI monitoring still trips it up and I'm refining it slowly.
But, it runs dozens of times a week, and the interruptions I started with are gone.
What I took from all of it is that I generalized far too early.
I try to avoid overengineering but sometimes the concept itself can be simplified.
Here, the fix was to build the smallest, most specific thing that solved my own problem.

Refining the system to be as simple as possible is satisfying.
You enter a loop: you start with an initial system, simplify it once, look at what's left, try to remove more, and repeat until it's finally simple enough.