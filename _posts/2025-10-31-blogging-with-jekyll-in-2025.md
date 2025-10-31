---
layout: post
title: Blogging with Jekyll in 2025
---

Wait wait wait I know it’s not flashy.
I decided to start blogging, now... 25 years after everyone else.

I know a blog isn’t exactly an innovative project.
It might even sound boring in the age of AI-generated everything.
But I like it.
Blogging feels personal.
Which by the way is kind of strange, right?
Writing personal things online?
It's maybe a bit of nostalgia.

This idea has been sitting in my head for a while, but it never felt like the right thing to do.
Probably because, every time I thought about it, I went straight into developer mode:

> Which tools should I use? What stack? What about the design, the hosting, the automation?

Basically, everything except the fact that I just wanted to write.

So, a few weeks ago, I decided to build something very minimal.
A simple website, made with very boring tech.
No fancy frameworks, no endless dependencies.

I knew I wanted to keep control of the underlying code (that’s my nerd side talking) so I didn’t want to use platforms like Medium or Substack for now.
Plus, I have no business goals here.
I just want a space to share thoughts, even if they don’t make sense to anyone but me.

I already had a small website hosted on GitHub Pages, so I started digging around and noticed they natively support Jekyll as a static site generator.
I opened the Jekyll documentation.
It’s short, well-written, and straight to the point.
It just felt right even if it’s Ruby (I know, I know).
It lets me keep control without needing an army of frameworks and build tools, but it still provides enough structure to write without touching raw HTML all the time.

The project was up and running in… what, maybe four hours?
All these years of hesitation, and that was it.

First, I [installed Jekyll](https://jekyllrb.com/docs/installation/macos/) locally.
Make sure to install the latest version of Ruby, not the one bundled with MacOS.

Then, the only slightly tricky part was integrating [Tailwind CSS](https://tailwindcss.com).
To do that, I installed and configured a PostCSS gem called [`jekyll-postcss-v2`](https://rubygems.org/gems/jekyll-postcss-v2).
The configuration is straightforward:

```js
// postcss.config.js
module.exports = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
};
```

I also needed to add this plugin to my Jekyll configuration file:

```yaml
# _config.yml
plugins:
  - jekyll-postcss

postcss:
  cache: false # Use Tailwind CSS JIT engine instead.
```

The last step was to [install Tailwind CSS](https://tailwindcss.com/docs/installation/using-postcss) and create its configuration file:

```js
// tailwind.config.js
module.exports = {
  content: ["./**/*.html"],
  plugins: [],
  theme: {},
};
```

I can now import the library in my main CSS file with:

```css
@import "tailwindcss";

h1 {
  /* Utility classes and the @apply keywords are available. */
  @apply text-xl;
}
```

And voilà!
The website now looks more like a web reader and I like that.
It’s simple, quiet, and kind of mine.
This article is written on something really not that cool.
But hey, who knows?
Maybe I’ll write something nice someday!
