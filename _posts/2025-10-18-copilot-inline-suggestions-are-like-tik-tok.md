---
layout: post
title: Copilot Inline Suggestions Are Like TikTok
---

I’ve spent the last few months using GitHub Copilot without inline suggestions.
Since the feature came out, I’ve been uneasy about it.
It feels to me like the TikTok vs. YouTube debate: do I want to choose the content I consume or let an algorithm feed me what it thinks I want?

Automatic suggestions often feel like a coworker who talks too much.
Suddenly you’re juggling a stream of half-relevant context that you didn’t ask for.
Sometimes useful, sure, but also distracting.

So I turned it off.

## Writing Without Interruptions

With inline suggestions disabled, coding feels more intentional.
I get the old craftsmanship vibe: I type what I mean, not what the AI nudges me toward.
At first, that felt liberating.

But the honeymoon ends quickly.
You start to realize how much friction comes from repetitive tasks.
Without Copilot filling in obvious loops or boilerplate, you feel slower, even a bit reduced.
Efficiency takes a hit.

## Using Copilot as a Copilot

That’s when I shifted how I think about AI.
Instead of treating Copilot like a partner constantly typing on my keyboard, I use it like an actual copilot: someone I ask for help when I want it.

I’ve noticed a pattern.
Each coding problem has thousands of possible solutions.
The mistake I used to make was assuming Copilot would “skip” the design phase for me.
It doesn’t.
If I start coding too soon, it happily glues together snippets and good ideas around a bad structure.
The result looks smart but feels wrong.

By writing first and asking questions later, I use AI more to challenge my ideas before I commit to code.
I started adding this kind of line to my prompts:

> Tell me if you need more information. Ask me questions.

The good thing is that, depending on the model you choose, it will not blindly try to ask questions.
For example, I used this method to find a way to fix an issue in a pytest plugin.
I added a bit of context, the stacktrace, and ended the prompt with:

> Can you find how to fix this issue?
> I also want to cover this case in the tests of the plugin.
> How can I do that?
> Tell me if you need more information.

In that specific case, the plan was clear and Copilot never asked for more information.

That small tweak changed the interaction completely.
Instead of being flooded with code, I get alternatives, nudges, and clarifications.
It feels like talking to a colleague instead of handing them my keyboard.

## Where It Still Shines

Even with inline suggestions off, I use Copilot heavily as an agent for:

- Repetitive, well-defined tasks — where I don’t need creativity, just output.
- Tests and test cases — Copilot is great at proposing edge cases I didn’t think of.

In these scenarios, I treat Copilot like a junior engineer: it does the grunt work, I review.

## My Takeaway

I’m biased: I actually enjoy writing code.
I like the structure, the choices, even the aesthetics.
I want my code to carry my “fingerprint”.
Copilot doesn’t take that away, but inline suggestions blur it too much for me.

That said, I’m not dogmatic.
Sometimes I’ll flip suggestions back on, or I’ll experiment with a bigger delay before they pop up.
The point is to keep control of the workflow — not let an algorithm steer my design.

For me, AI is best when it’s a partner that asks good questions and proposes alternatives.
It should help me **think better**, not just type faster.
