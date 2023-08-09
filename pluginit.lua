local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("catppuccin/nvim", {as = "catppuccin"})

vim.call("plug#end")

-- vim plug config
vim.g.plug_window = "topleft new"
