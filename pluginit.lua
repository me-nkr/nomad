local Plug = vim.fn["plug#"]

local status = pcall(vim.call, "plug#begin")
if not status then
	return print("vim-plug not installed")
end

-- appearance
Plug("catppuccin/nvim", {as = "catppuccin"})

-- treesitter
Plug("nvim-treesitter/nvim-treesitter", {['do'] = ':TSUpdate'})

-- language server
Plug "neovim/nvim-lspconfig"

vim.call("plug#end")

-- vim plug config
vim.g.plug_window = "topleft new"
