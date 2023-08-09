-- import nvim-lspconfig plugin safely
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return print("nvim-lspconfig not installed")
end

-- configure typescript-laguage-server
lspconfig.tsserver.setup{}
