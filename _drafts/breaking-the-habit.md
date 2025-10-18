---
layout: post
title: Breaking The Habit
---

When in a hurry, or emotionnaly affected, I often find myself doing crazy clicks on my iPhone.
I tried to use many strategies to reduce my screen time over the last years.
The first one was to completely remove social apps from it.
I also wanted to have a clear distinction with my personal/professional apps.
So, for a long time, I completely removed apps like Slack, GitHub, Linear, even my Mail client.
It worked, for a time, but it really creates a lot of friction and reduces the flexibility of my operating system.
I want to be able to use any device capable of helping me through my day.
The problem is not the device, it's how I use it.
I also worked on the notifications.
The problem when I remove all the apps is that I can't be notified for important things.
I know it's good to remove as many notifications as you can.
But, sometimes, removing too much notifications for very important things or things that would require immediate attention can be counter-productive.
It's not intuitive for me, but we I installed Slack again on my iPhone I removed the fear of missing an important piece of information.
I could have used native MacOS notifications, but what if I need to go for a walk to think a bit about a deep technical problem or for a meeting?
Having the ability to receive instant notifications should also remove one very bad habit I have: to unlock my phone, go to the app library, open the app, check nothing, lock my phone again.
It's ridiculous the number of times it happens.
That's when I decided to build a small system with Apple native apps (I'm pretty sure Android users can do the same things).
The requirements are simple:

- Allow me to use Slack (and other working apps) during the working hours,
- Try to reduce the notifications the only the most important ones,
- Prevent the no-brainer usage when I open the app to check nothing.

The first point is simple, install the apps.
Just be careful to install only apps that are relevant on a mobile device.
I installed Slack, GitHub and Notion so I can communicate with my colleagues, consult shared knowledge and even review some small PRs on-the-fly when needed.
I don't want to write code on my phone.
I use Apple Notes and Freeform a lot for small ideas, design documents etc. though.
Then, I set up notifications on my device.
The most important part is to reduce the noise.
So, for example, I'm using scheduled iOS notifications for emails because I can wait for them.
I don't want a notification for each email.
I prefer to have a batch of notifications 2-3 times a day.
For Slack, I try to be really careful with channels.
I removed all notifications from all other working apps as they don't require immediate attention?
I also have calendar notifications on my mobile device instead of my laptop.
I'm using an Apple Watch and I think it's better to make sure that I'm always notified wherever I am.
The goal, in the end, is just to make sure that the system is reliable enough so I don't have to stress or even think about it.
Finally, the last step was to use an Apple Shortcut to block the apps.
I wanted a simple system, so I just built an automation which is trigerred anytime I open the selected apps (Slack and Mails) and checks whether we are in the configured working days/hours.
If not, it stops the app and returns on the homescreen with a gentle notification.
It's not a super strong system, and it's not the goal.
I still want to be able to access my apps if I really need to.
It requires a bit of discipline and intention to know whether you're acting because of a bad habit or if you're very intentional.
That's the only ambition of this system, to bring back intention in these very addictive systems.
