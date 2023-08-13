local opt = vim.opt -- aliasing

-- line number
opt.number = true

-- tabs & intendation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

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
