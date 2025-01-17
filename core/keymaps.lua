local keymap = vim.keymap -- aliasing

-- map leader key to space
vim.g.mapleader = " "
keymap.set("i", "<Space>", "<Space>") -- disable leader in normal mode


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

-- notebook (molten)
keymap.set("n", "<leader>ni", ":MoltenInit<CR>")
keymap.set("n", "<leader>nd", ":MoltenDeinit<CR>")
keymap.set("n", "<leader>nr", ":MoltenRestart<CR>")
keymap.set("n", "<leader>nR", ":MoltenRestart!<CR>")

keymap.set("n", "<leader>ncp", ":MoltenPrev<CR>")
keymap.set("n", "<leader>ncn", ":MoltenNext<CR>")
keymap.set("n", "<leader>ncd", ":MoltenDelete<CR>")
keymap.set("n", "<leader>ncc", ":MoltenEvaluateLine<CR>")
keymap.set("v", "<leader>ncc", ":<C-u>MoltenEvaluateVisual<CR>")
keymap.set("n", "<leader>ncr", ":MoltenReevaluateCell<CR>")
keymap.set("v", "<leader>ncx", ":MoltenInterrupt<CR>")

keymap.set("n", "<leader>nos", ":MoltenShowOutput<CR>")
keymap.set("n", "<leader>noh", ":MoltenHideOutput<CR>")
keymap.set("n", "<leader>noe", ":noa MoltenEnterOutput<CR>")

-- lsp
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
keymap.set("n", "<leader>rr", vim.lsp.buf.references)
keymap.set("n", "<leader>ra", vim.lsp.buf.code_action)
