-- map leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- aliasing

-----------------
-- editor keymaps
-----------------

-----------------
-- config keymaps
-----------------

-- config reload
keymap.set("n", "<leader> ", ":RC<CR>")
keymap.set("n", "<leader>con", ":exe 'lcd' stdpath('config')..'/lua/nomad'<CR>")

-- misc
keymap.set("n", "<leader>ms", ":SP ")

-----------------
-- plugin keymaps
-----------------

-- vim-plug
keymap.set("n", "<leader>pli", ":PlugInstall<CR>")
keymap.set("n", "<leader>pls", ":PlugStatus<CR>")

-- treesitter
keymap.set("n", "<leader>tsi", ":TSInstall")
keymap.set("n", "<leader>tsm", ":TSModuleInfo<CR>")
