---
layout: post
title: "Dependencies, Inputs, Outputs: My Shortcut To Write Tests"
---

I often struggle with writing unit tests.
Sometimes, everything is clear before I even start coding: I can see the structure, and writing tests from the start feels natural.
Those are good days.

Other times, I need to experiment first.
I try things, adjust the design, maybe even build the feature completely before worrying about tests.
And that’s when writing them suddenly feels like climbing uphill.
My brain is still in "feature mode", focused on what the code does, not how it behaves under different inputs.

When I write tests after building something, I have to rewind my own mental model — break down what I just finished, recall the critical paths, and figure out where to poke it.
It’s doable, but it always takes me a few deep breaths to switch gears.

## A Small Trick That Helps Me Pause

Lately, I’ve been using a really simple method that helps me make that mental switch.
Whenever I’m about to write tests I start by writing down three things:

```
1. Dependencies
2. Inputs
3. Outputs
```

That’s it.
Just three bullet points, often scribbled in a comment.

It sounds almost too basic, and it is, but writing these down forces me to re-clarify what matters.
It’s not about writing formal specs, but about thinking long enough to see the shape of what I’m testing again.

## An Example

Here’s how it looks in practice.
I’ve been working on a `pytest` plugin that automatically detects new tests.
To test that behavior, I first write out:

```
1. Dependencies
    - `pytester`, to execute the plugin and simulate test runs
    - A web server, since the plugin needs to call an API to check which tests are new

2. Inputs
    - The list of existing tests (what the system already knows)
    - The test suite to run (what’s new in this run)

3. Outputs
    - The list of newly detected tests
```

From that tiny list, I can immediately see the shape of a minimal test case:

```python
# 1. Dependencies
pytester = ...
server = ...

# 2. Inputs
existing_tests = ["test_login", "test_signup"]
suite = ["test_login", "test_signup", "test_logout"]

# 3. Outputs
expected_new_tests = ["test_logout"]
```

Writing this down usually takes less than a minute.
But it clears my head because I stop thinking about the whole plugin and just focus on one behavior at a time.
Without it, I tend to copy-paste old tests and tweak them until they work, which feels more like guesswork than testing.

I’ll often feed this list into an LLM to generate test cases (it tends to write edge cases I wouldn’t have thought of).
With that additional context, the AI doesn’t have to guess what the code does and can focus instead on what I want to verify.
That’s especially helpful for code like this, where the logic lives inside a broader framework (pytest, in this case).

## Why It Works for Me

This isn’t a grand testing philosophy.
It’s more of a small mental reset or a way to think, slow down, and get back into "testing mode" after building something.
The list reminds me that every test is just a combination of what I depend on, what I change, and what I expect.

It’s simple, maybe too simple, but it keeps me from getting stuck staring at an empty test file.
And that’s good enough for me.
