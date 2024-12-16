local Plug = vim.fn["plug#"]

local status = pcall(vim.call, "plug#begin")
if not status then
	return print("vim-plug not installed")
end

-- appearance
Plug "Mofiqul/vscode.nvim"
Plug "stevearc/dressing.nvim"

-- treesitter
Plug("nvim-treesitter/nvim-treesitter", {['do'] = ':TSUpdate'})

-- language server
Plug "williamboman/mason.nvim"
Plug "williamboman/mason-lspconfig.nvim"
Plug "neovim/nvim-lspconfig"

-- autocompletion
Plug "hrsh7th/cmp-nvim-lsp"
Plug "KadoBOT/cmp-plugins"
Plug "windwp/nvim-autopairs"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/cmp-buffer"
Plug "ray-x/cmp-treesitter"
Plug "hrsh7th/cmp-nvim-lua"
Plug "hrsh7th/cmp-nvim-lsp-signature-help"
Plug "hrsh7th/nvim-cmp"

Plug "hrsh7th/cmp-vsnip"
Plug "hrsh7th/vim-vsnip"

-- custom syntax
Plug "sevko/vim-nand2tetris-syntax" -- nand2tetris custom languages

vim.call("plug#end")

-- vim plug config
vim.g.plug_window = "topleft new"
