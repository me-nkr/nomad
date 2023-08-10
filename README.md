# Nomad
Exploration, experimentation, and journey to the unknowns.

This is a neovim config, my first custom config actually.

## Current Features
- Vim Plug as plugin manager
    - Find details in `pluginit.lua`
- Catppuccin Macchiato for color scheme
- Nvim Treesitter for syntax highlighting
- Nvim Lspconfig for lsp
    - Typescript Language Server is being called ( install it using `npm i -g typescript typescript-language-server` )
- Keybindings for plugins, plugin manager and couple of other stuff
    - Explore `core/keymaps.lua` to familiarize yourself ( open an issue if you need a table of keymaps )

If you're on windows, read [this](#for-windows-users)

## To Use
- *`configdir`* is `~/.config/nvim/` for linux and <code>C:\User\\<i>Username</i>\AppData\Local\nvim</code> in windows
- Install vim-plug [form here](https://github.com/junegunn/vim-plug)
- Go to <code><i>configdir</i>/lua</code> and clone this repo
- Edit <code><i>configdir</i>/init.lua</code> and add `require('nomad')` and comment out everything else
- Open neovim and run `:PlugInstall` or use `<space>pli`
- Close and open neovim ( or use `:RC` or `<space><space>`)
- Viola you witness the journey

## For windows users
- When I say shell its mostly Powershell
- You need to have git installed
    - install it from [here](https://git-scm.com/download/win)
- You need to have neovim installed
    - suggestion: use [chocolatey](https://chocolatey.org/install) and [gsudo](https://github.com/gerardog/gsudo)
        - install gsudo with `choco install gsudo` form a elevated shell ( Run as admin )
        - word of caution: exit elevated shell asap and open a normal shell ( not Run as admin )
- You need to have a C compiler installed for treesitter to work
    - suggestion: use [MinGW-w64](https://www.mingw-w64.org/) ( you can use the compiler with gcc if you're curious )
        - install with `gsudo choco install mingw`
- You have to create a folder named `nvim` in <code>C:\User\\<i>Username</i>\AppData\Local\nvim</code>
- continue to [using instructions](#to-use)
