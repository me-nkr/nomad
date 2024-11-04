-- map leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- aliasing

-----------------
-- editor keymaps
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

-- lspconfig
    -- diagnostics
vim.keymap.set("n", "<leader>lsdo", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lsdp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>lsdn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lsdl", vim.diagnostic.setloclist)

    -- completion and gotos
vim.api.nvim_create_autocmd("LspAttach", {

  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)

    -- completion with omnifunc
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- gotos
    local opts = { buffer = ev.buf }

    -- decleration to references
    vim.keymap.set("n", "<leader>lsbdl", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>lsbdf", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>lsbdi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>lsbdt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>lsbdr", vim.lsp.buf.references, opts)

    -- the useful ones, signature, format and rename
    vim.keymap.set("n", "<leader>lsbs", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>lsbr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lsbf", function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- workspace management
    vim.keymap.set("n", "<leader>lsbwa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>lsbwr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>lsbwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- the unknowns or helps i guess
    vim.keymap.set("n", "<leader>lsbhs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set({ "n", "v" }, "<leader>lsba", vim.lsp.buf.code_action, opts)
  end,
})
