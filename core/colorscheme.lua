-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme catppuccin-macchiato")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

-- Todo
-- 1. Explore how to modify colorschemes
-- 2. Modify catppuccin maybe?
-- 3. Create a minimal colorscheme
