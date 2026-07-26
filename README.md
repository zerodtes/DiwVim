# DiwVim

**NOTE:** This is for AstroNvim v5+

A customized [AstroNvim](https://github.com/AstroNvim/AstroNvim) configuration.

## ✨ Features

- **Language support** via [AstroCommunity](https://github.com/AstroNvim/astrocommunity) packs — LSP, treesitter, formatting, linting, and debugging preconfigured for:
  - Python, Go, C/C++, TypeScript/React, JSON, Markdown, Lua
- **Git** — [gitsigns](https://github.com/lewis6991/gitsigns.nvim), [lazygit](https://github.com/jesseduffield/lazygit) (`<Leader>gg`), and [diffview.nvim](https://github.com/sindrets/diffview.nvim) for diffs and merge conflicts
- **Project-wide search & replace** — [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)
- **Diagnostics list** — [trouble.nvim](https://github.com/folke/trouble.nvim)
- **Motion** — [flash.nvim](https://github.com/folke/flash.nvim) for jumping anywhere on screen
- **Claude Code integration** — [claudecode.nvim](https://github.com/coder/claudecode.nvim) (`<Leader>a` mappings)
- **TypeScript error translation** — [ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim)
- **Discord rich presence** — [cord.nvim](https://github.com/vyfor/cord.nvim)
- **Theme** — [tokyonight](https://github.com/folke/tokyonight.nvim) (night style)
- **Custom statusline** — rounded separators, word count in prose files, and a live Claude Code connection indicator
- Format on save (configured in `lua/plugins/astrolsp.lua`)

## 🔧 Requirements

- Neovim 0.10+
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `git`, `curl`, a C compiler (for treesitter), and `node` (for some language servers)
- [lazygit](https://github.com/jesseduffield/lazygit) (optional, for the git UI)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/zerodtes/DiwVim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

Language servers, formatters, and debuggers install automatically via Mason on first launch.
