local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- appearance
Plug("catppuccin/nvim", {as = "catppuccin"})

-- treesitter
Plug("nvim-treesitter/nvim-treesitter", {['do'] = ':TSUpdate'})

vim.call("plug#end")

-- vim plug config
vim.g.plug_window = "topleft new"
