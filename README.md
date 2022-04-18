# Lunarfig.nvim

For lazy people who would like to configure [Lunarvim](https://lunarvim.org)
with JSON, similar to how `settings.json` works with VSCode.

> **Warning**: Those with long term exposure to Vim may have developed an
> allergic reaction to the word "VSCode". This word is used repeatedly
> throughout this README. 

## Why Lunarfig?

**TLDR;** This plugin is targeted toward those coming from VSCode and aims to provide a
similar experience to VSCode's `settings.json` while aiding the journey towards
full Neovim adoption.

### A "Little" Background

TODO: Turn this section into a blog post... 😅

> It was as though VSCode was giving me an ultimatum: "It's me... or Vim".

#### In the beginning

My story is not uncommon. Early in my college days, I took a class where the
professor gushed about this thing I had never heard of -- an editor called Vim.

At first I was intrigued. Through innocent curiosity, I began to dabble. Of
course, I was terrible at first, but took pride in each small step gained. I
grew in confidence, knowing I could SSH into a remote server and edit files
without getting completely lost. Sure, I'd still reach for the arrow keys
instead of `hjkl` and occasionally get stuck in `Ex` mode (honestly, I still
don't know how to get out of `Ex` mode), but slowly I improved. Yet, I never
went "full vim".

At the time, I had been in a relationship with Atom when this new flashy new
text editor caught my eye -- Visual Studio Code. It was well connected and
developed by a wealthy company. I quickly moved on from Atom. Things were
wonderful in the beginning. However, and eventually, the feelings grew
platonic. I kept asking myself if I'd made the right decision. But you know...
we just worked! VSCode was safe, familiar, and provided a sense of stability.

#### Life moves on

Eventually I graduated from college and began a career. Occasionally, I'd run into
my old friend Vim and old feelings would resurface. I don't know if it was
simply boredom or realizing VSCode wasn't allowing me to be my best self, but I
started flirting with the idea of using Vim as my full time text editor.

As much as it made my wrist ache, it was just too hard. By this point, VSCode
and I already had several projects together. It wasn't just about me anymore,
you know! Sure, I installed the Vim extension in VSCode, but in a way this only
made things worse. The more I got used to the Vim keybindings and saw my
productivity and developer satisfaction increase, the more I realized there was
no going back. **I felt stuck between two worlds, VSCode on one hand and Vim on
the other. I was living a dual life and I could tell Vim didn't feel like it
belonged. This is perhaps a silly analogy, but it was almost like a mistress
living in a house she knows isn't really her own.**

> I felt stuck between two worlds, VSCode on one hand and Vim on the other. I
> was living a dual life and I could tell Vim didn't feel like it belonged.
> This is perhaps a silly analogy, but it was almost like a mistress living in
> a house she knows isn't really her own.

Time passed and I began to convince myself things would work out. And
then, as life would have it, I was unexpectedly put on a large Typescript
project. Out of nowhere, VSCode started struggling, like, a lot. The constant
linting, auto formatting, file watchers, and running code diagnostics became
too much for VSCode. 

#### The ultimatum

Others had warned me of potential performance problems with VSCode, and trust
me, I had had my suspicions. Yet, I never thought it would happen to me. To me!
I tried disabling other extensions in the hopes of patching things over, but in
the end it was as I had feared. The bulk of the performance issues stemmed from
my relationship with Vim. _It was as though VSCode was giving me an ultimatum:
"It's me... or Vim"._

And so I followed my heart and left VSCode.

It was hard. There were difficult days. At times I felt tempted to run back to
the familiarity of VSCode. But I was done settling.

Even though I was fully committed to this new life, I couldn't deny that VSCode
had changed me. I realized the most important thing to me was simply having an
editor that just works. Even to this day, I still struggle with this.

#### The essence of Vim

Vim comes with it's own set of tradeoffs, usually in the form of an upfront
cost that must be paid with large amounts of time. Entering the world of Vim is
extremely daunting for the uninitiated. But simply *understanding* Vim is not
enough. In a literal sense, you must *become* Vim. Effectiveness in Vim comes
as a result of repeatedly doing the same things over and over until they become
automatic. That's the essence of Vim. You simply think of what you want and it
happens automatically. But boy oh boy, it takes time to get there.

I no longer consider VSCode a viable alternative... _for me_. This is, after
all, a personal journey. Yet, on the other hand it takes hours of configuring
`init.vim` (or `.vimrc`) to bring Vim up to feature parity with VSCode. And
after the configuration is done, it takes even more hours of muscle memory
training before the promise of increased productivity comes to fruition. Even
after all of this, I oftentimes come across a plugin I didn't know of that
solves a problem I didn't know I had or does so better than my current
workflow, bringing me back, bringing me back to square one.

There's a sentiment in Vim culture that one's `.vimrc` is a very personal
thing. When someone shares their Vim config publicly, it's mostly done in the
spirit of providing inspiration or instruction. For long term Vim users,
adopting someone else's config would represent a massive disruption to their
workflow.

New Vim users are more prone to doing a full "copy-paste" of someone else's
config, which only results in a suboptimal effectiveness. This is because new
users don't understand or even consider how the author arrived to a specific
setup, including what problems they were trying to solve, why they chose a
specific set of plugins, their choice of keybindings, and on and on.

As a
personal example, I just discovered the power of combining Telescope integrated
with ripgrep to pipe language diagnostic information into a quickfix list so I
can apply a regex pattern with `:cdo` and preform a project wide find and
replace.

Those familiar with the workflow I just described are going, "Awesome, right!".
Long term Vim users who're unfamiliar with one or more of the tools mentioned
are going, "Hmm, sounds interesting..." and typing `:h cdo` to learn more. New
Vim users are going, "Wtf does any of that mean?...", and VSCode users are
going, "Um, or you could just hit `Ctrl/Cmd+Shift+F"` in VSCode..."

#### So now what?

[Lunarvim](https://lunarvim.org) is an "IDE layer for Neovim" that ships with a
nice collection of plugins.

I've felt the confusion of figuring out which plugin manager to use, why there
are so many, and feeling frustrated that I even needed to care. I've picked up
Lua for no other reason than to configure Neovim. Yeah, it's a nifty little
language. No I don't care. After all, I use Vim for the express purpose of
removing any barriers that get in the way of me writing code as quickly as
possible.

Projects such as Lunarvim have tried to lower this barrier by providing a
preconfigured Neovim experience. This is a Lunarvim specific plugin, which you
can think of as an attempt to lower the barrier even further.

I don't expect anyone other than myself to use this, but it would be awesome to
see if others are interested in this project.

## Usage

TODO: fill this out...

Create a `config.json` file inside your `~/.config/lvim` folder.

```json
{
  "fontFamily": "Hack Nerd Font",
  "fontSize": 15,
  "colorscheme": "gruvbox",
  ...
}
```
