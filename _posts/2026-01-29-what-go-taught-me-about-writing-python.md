---
layout: post
title: What Go Taught Me About Writing Python
---

Six months ago, I stopped writing Go every day and started shipping Python to production.

Before joining Mergify, I spent a few years working primarily in Go. Backend services, APIs, systems where performance and correctness mattered. At Mergify, Python was the language in production.

This post is a reflection on **developer experience** after six months of real-world Python usage, seen through the lens of someone shaped by Go. I'm focusing on web apps, tooling, testing, and shipping code.

## Shipping Speed: Python Is Relentlessly Fast

The first thing that surprised me was **how fast you can build things in Python**.

Spinning up an API, wiring a service, gluing components together: it all feels immediate. There's very little friction between "I have an idea" and "it's running locally." In Go, I spent more time upfront designing types, interfaces, and data flows before seeing anything work.

Python flips that order. You build first, shape later.

This makes experimentation cheap. You try things you might not bother with in a more rigid environment. But it also sets the tone for everything that follows: Python optimizes for velocity, not enforcement.

Go optimizes for correctness from the start. You pay the cost early, but you rarely wonder later what a piece of code is supposed to do.

## Typing: Go Still Lives in My Head

If there's one thing Go permanently changed in how I write code, it's **typing**. Not typing as a safety net, but typing as a **design tool**.

Writing Go for years trained me to think carefully about what objects exist in the system, how they're named, what data flows between layers, and where responsibilities start and stop. That mindset carried over directly to Python.

Python's typing is optional, porous, and negotiable. Even with strict settings and an army of linters, you can always fall back to `typing.Any`. In practice, you sometimes do, especially at boundaries:

```python
import typing

def make_sql_statement() -> sqlalchemy.Select[tuple[typing.Any, ...]]:
    ...
```

This starts as a pragmatic choice and slowly spreads. Dictionaries become the norm. Shapes are implicit. The compiler stops being a design partner and becomes a suggestion engine.

The most painful part is **external libraries**. Many popular Python libraries are poorly typed, or not typed at all. Combined with sparse documentation, this often leads to reverse-engineering: reading source code, stepping through functions, or adding print statements just to understand what's going on.

In Go, you fight the compiler. In Python, you sometimes fight reality.

> Python doesn't prevent bad modeling. It just makes it easier to postpone it.

If you bring Go's discipline with you, Python's flexibility is powerful. If you don't, things get fuzzy fast.

## Writing Code: Faster in Python, Easier in Go

One sentence kept coming back to me over these six months:

> It's faster to write Python, but it's easier to write Go.

Python has more concepts, more magic, more ways to express the same idea. Decorators, context managers, dynamic attributes, metaclasses, magic methods. There's a lot going on.

Go keeps the surface area intentionally small. Fewer concepts, fewer surprises, fewer ways to do the same thing.

This shows up when mapping data between layers. In Go, if you want clean separation between an API layer and a domain layer, you write explicit mapping code:

```go
func NewUser(model UserModel) User {
    return User{
        ID:    model.ID,
        Name:  model.Name,
        Email: model.Email,
    }
}
```

It's verbose. It feels like boilerplate. You even end up writing a bunch of tests just to make sure all your fields are properly passed from one type to another. But it's explicit and quite easy to reason about.

In Python, the same thing might look like:

```python
@dataclasses.dataclass
class User:
    id: str
    name: str
    email: str

user = User(**model)
```

That conciseness is fantastic. But it hides assumptions. If the shape changes, you'll find out later. Often in tests, sometimes in production.

Python feels liberating; Go feels grounding.

## Tooling Philosophy: Centralized vs Community-Driven

One of the bigger cultural shifts for me was tooling.

Go's tooling philosophy is clear: most things come with the language. You install Go, install the official IDE extension, and you're productive. Formatting, testing, linting all work out of the box.

Python's tooling is community-driven. That's both its strength and its weakness.

On one hand, you get incredible innovation: FastAPI, pytest, uv, poetry, mypy, ruff. On the other hand, you spend real time understanding the stack. FastAPI is built on Starlette, which relies on... wait, where does this error come from?

There's also no single standard. It's easy for your IDE setup to drift from your CI setup. If you're using pytest with uv, poe, multiple linters, and custom scripts, you have to work to ensure your local feedback matches reality.

In Go, IDE ≈ CI by default. In Python, this gap is shrinking, but it's still noticeable.

## Testing: Weird at First, Then Powerful

Testing is where Python won me over.

At first, it felt uncomfortable. You don't get all the same IDE features you're used to in Go. Fewer guarantees, fewer compile-time signals. But once properly configured, pytest is powerful.

I spent several months working on a pytest plugin, which forced me to dig into its internals. The framework follows a Unix-like philosophy: small hooks, clear inputs and outputs, composability everywhere.

That's why the ecosystem is so strong. You get plugins for parallel execution, coverage, test splitting, selective execution, and flaky test handling.

The one thing I still miss is Go's table-driven tests:

```go
tests := map[string]struct{
    input, want string
}{
    "test case 1": {input: "foo", want: "bar"},
    "test case 2": {input: "baz", want: "qux"},
}
for name, tt := range tests {
    t.Run(name, func(t *testing.T) {
        ...
    })
}
```

I know a lot of people don’t like this method. But I think [it forces you to think about (1.) dependencies, (2.) inputs, and (3.) outputs](https://remy.duthu.org/2025/10/27/dependencies-inputs-outputs.html). They're explicit, readable, and fully typed. Pytest's parametrization is powerful, but you lose typing quickly with layered fixtures and indirect dependencies.

Still, for large test suites, Python's testing ecosystem is world-class.

## Concurrency: I Don't Miss Goroutines As Much As I Thought

I expected to miss [goroutines](https://go.dev/tour/concurrency/1) more than I do.

Coming from Go, goroutines feel like a requirement for any modern language. Lightweight concurrency, simple syntax, powerful primitives.

In practice, with a proper queue system and worker model, things work fine. Workers are easier to debug, easier to observe, probably more robust, and easier to reason about than implicit concurrency everywhere. Less magic, more explicit flow.

## Deployment: Go Still Wins

Deployment is the one area where Python can't compete.

A Go service compiled into a single static binary, shipped with [a multi-stage Dockerfile](https://docs.docker.com/guides/golang/build-images/#multi-stage-builds) ending in `FROM scratch`, is hard to beat. Python images are heavier. They're acceptable for web apps, but never elegant.

## What Changed How I Code

Python didn't replace Go in my head. I think Go made me a better Python engineer. It taught me to care about boundaries, naming, and data flow, even when the language doesn't force me to.

Python rewards speed. Go enforces a kind of discipline.

One thing I didn't cover here is Python's reach beyond web apps. LLMs, data science, R&D: Python is everywhere. That adoption brings a massive community, and that community is genuinely helpful. Go's community is great too, but Python's sheer size means more libraries, more answers, and more people who've hit the same problems you have.

After six months, I'm convinced the best results come from combining both: moving fast, but acting as if the compiler were watching, even when it isn't.
