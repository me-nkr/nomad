-- map leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- aliasing

-----------------
-- plugin keymaps
-----------------

-- vim-plug
keymap.set("n", "<leader>pi", ":PlugInstall<CR>")
keymap.set("n", "<leader>ps", ":PlugStatus<CR>")
