local keymap = vim.keymap -- aliasing

-- map leader key to space
vim.g.mapleader = " "
keymap.set("i", "<Space>", "<Space>") -- disable leader in normal mode


-----------------
-- editor keymaps
-----------------

-- help
keymap.set("n", "<leader>h", ":HELP<CR>", { desc = "Show keymaps", silent = true })

-- window
keymap.set("n", "<leader>wm", ":res<CR>:vert res<CR>", { desc = "Maximize window", silent = true })

-- misc
keymap.set("n", "<leader>ms", ":SP ", { desc = "Open scratch tab <lanuage>", silent = true })

-----------------
-- config keymaps
-----------------

-- config reload
keymap.set("n", "<leader> ", ":RC<CR>", { desc = "Reload config", silent = true })
keymap.set("n", "<leader>con", ":exe 'lcd' stdpath('config')..'/lua/nomad'<CR>", { desc = "Debug: Switch to config directory", silent = true })

-----------------
-- plugin keymaps
-----------------

-- netrw
keymap.set("n", "<leader>fe", ":Lex!<CR>", { desc = "Toggle file explorer sidebar", silent = true })
keymap.set("n", "<leader>fo", ":Lex! ", { desc = "Open file <file>", silent = true })

-- vim-plug
keymap.set("n", "<leader>pli", ":PlugInstall<CR>", { desc = "Vim Plug: Install all plugins", silent = true })
keymap.set("n", "<leader>pls", ":PlugStatus<CR>", { desc = "Vim Plug: Plugins status", silent = true })

-- treesitter
keymap.set("n", "<leader>tsi", ":TSInstall ", { desc = "Install treesitter parser <language>", silent = true })
keymap.set("n", "<leader>tsm", ":TSModuleInfo<CR>", { desc = "Treesitter modules status", silent = true })

-- notebook (molten)
keymap.set("n", "<leader>ni", ":MoltenInit<CR>", { desc = "Notebook: Initialize notebook", silent = true })
keymap.set("n", "<leader>nd", ":MoltenDeinit<CR>", { desc = "Notebook: Deinitialize notebook", silent = true })
keymap.set("n", "<leader>nr", ":MoltenRestart<CR>", { desc = "Notebook: Restart notebook", silent = true })
keymap.set("n", "<leader>nR", ":MoltenRestart!<CR>", { desc = "Notebook: Forece Restart notebook", silent = true })

keymap.set("n", "<leader>ncp", ":MoltenPrev<CR>", { desc = "Notebook: Go to previous cell", silent = true })
keymap.set("n", "<leader>ncn", ":MoltenNext<CR>", { desc = "Notebook: Go to next cell", silent = true })
keymap.set("n", "<leader>ncd", ":MoltenDelete<CR>", { desc = "Notebook: Delete cell", silent = true })
keymap.set("n", "<leader>ncc", ":MoltenEvaluateLine<CR>", { desc = "Notebook: Execute single line", silent = true })
keymap.set("v", "<leader>ncc", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Notebook Execute selected code", silent = true })
keymap.set("n", "<leader>ncr", ":MoltenReevaluateCell<CR>", { desc = "Notebook: Execute cell", silent = true })
keymap.set("v", "<leader>ncx", ":MoltenInterrupt<CR>", { desc = "Notebook: Interrupt execution", silent = true })

keymap.set("n", "<leader>nos", ":MoltenShowOutput<CR>", { desc = "Notebook: Show cell output", silent = true })
keymap.set("n", "<leader>noh", ":MoltenHideOutput<CR>", { desc = "Notebook: Hide cell output", silent = true })
keymap.set("n", "<leader>noe", ":noa MoltenEnterOutput<CR>", { desc = "Notebook: Enter into output section", silent = true })

-----------------
-- mouse keymaps
-----------------

keymap.set("n", "<MiddleMouse>", "<LeftMouse>K", { remap = true, desc = "Show details", silent = true })
keymap.set("n", "<C-MiddleMouse>", ":ccl<CR>", { desc = "Close quickfix window", silent = true })
vim.cmd [[
    amenu disable PopUp.How\-to\ disable\ mouse
    amenu PopUp.-1-                         <NOP>
    anoremenu PopUp.Rename                  <cmd>lua vim.lsp.buf.rename()<CR>
    anoremenu PopUp.References              <cmd>lua vim.lsp.buf.references()<CR>
    anoremenu PopUp.Code\ Actions           <cmd>lua vim.lsp.buf.code_action()<CR>
    amenu PopUp.-2-                         <NOP>
    anoremenu PopUp.Show\ Diagnostics       <cmd>lua vim.diagnostic.open_float()<CR>
    amenu PopUp.-3-                         <NOP>
    anoremenu PopUp.Back                    <C-O>
]]

