-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return print("nvim-treesitter not installed")
end

-- configure treesitter
treesitter.setup({

  highlight = { enable = true },
  indent = { enable = true },

  ensure_installed = {},

  auto_install = false,

})

-- Todo
-- 1. Understand the treesitter config better
-- 2. Highlight on errors
-- 3. Understand incremental selection
