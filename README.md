# Lunarfig.nvim

Lunarfig is a plugin for [Lunarvim](https://lunarvim.org), which aims to
provide an easy-to-use configuration experience similar to `settings.json` in
VSCode.

**Warning**: This plugin is in the _VERY_ early stages of development. As in
the pre-alpha stage. So, you probably don't want to use it yet.

## Why Lunarfig?

This plugin is targeted toward those coming from VSCode and aims to provide a
similar experience to VSCode's `settings.json` while aiding the journey towards
full Neovim adoption.

I wrote a [blog post](https://medium.com/@craig.blackburn/the-essence-of-vim-perspectives-from-a-vscode-user-f661a477dac4) on the motivations behind creating this plugin.

> It was as though VSCode was giving me an ultimatum: "It's me... or Vim".

## Development

I built this plugin for myself, but would be ecstatic to find others are
interested in it. At this point, these notes are mainly for myself as I'm
nowhere near ready to take contributions.

## Usage

Create a `config.json` file inside your `~/.config/lvim` folder.

```json
{
  "fontFamily": "Hack Nerd Font",
  "fontSize": 15,
  "colorscheme": "gruvbox",
  ...
}
```
