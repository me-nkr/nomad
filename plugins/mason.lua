-- import mason plugin safely
local status, mason = pcall(require, "mason")
if not status then
  return print("mason.nvim not installed")
end

-- import mason-lspconfig plugin safely
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
  return print("mason-lspconfig.nvim not installed")
end

mason.setup()
mason_lspconfig.setup()
