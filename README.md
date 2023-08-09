# Nomad
Exploration, experimentation, and journey to the unknowns.

This is a neovim config, my first custom config actually.

## Current Features
- Vim Plug as plugin manager
    - Find details in `pluginit.lua`
- Catppuccin Macchiato for color scheme
- Nvim Treesitter for syntax highlighting
- Nvim Lspconfig for lsp
    - Typescript Language Server is being called ( install it using `npm i -g typescript-language-server` )
- Keybindings for plugins, plugin manager and couple of other stuff
    - Explore `core/keymaps.lua` to familiarize yourself ( open an issue if you need a table of keymaps )

## To Use
- Install vim-plug [form here](https://github.com/junegunn/vim-plug)
- Go to `~/.config/nvim/lua` and clone this repo
- Edit `~/.config/nvim/init.lua` and add `require('nomad')` and comment out everything else
- Open neovim and run `:PlugInstall` or use `<space>pli`
- Close and open neovim ( or use `:RC` or `<space><space>`)
- Viola you witness the journey
