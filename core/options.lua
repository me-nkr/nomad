-- aliasing
local opt = vim.opt
local g = vim.g

-- core
opt.updatetime = 500

-- line number
opt.number = true

-- tabs & intendation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldlevel = 999
opt.foldtext = ""

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- wrapping
opt.showbreak = ">>"
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = { 'shift:4', 'min:40', 'sbr' }

-- netrw
g.netrw_preview = 1
g.netrw_liststyle = 3
g.netrw_winsize = 20
g.netrw_banner = 0
-- g.netrw_keepdir = 0

-- Todo
-- 1. Comments
--      1. off for single line ones
--      2. on for multiline ones
-- 2. Signcolumn
--      1. understand it and set accordingly
-- 3. Clipboard
--      1. understand clipboard options
--      2. find a way to integrate wsl clipboard
--      3. also look at appending 'unnamedplus'
