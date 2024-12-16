-- import nvim-lspconfig plugin safely
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return print("nvim-lspconfig not installed")
end

-- import cmp-nvim-lsp plugin safely
local status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
  return print("cmp-nvim-lsp not installed")
end

local nvim_cmp_capabilities = cmp_lsp.default_capabilities()

lspconfig.lua_ls.setup {
    capabilities = nvim_cmp_capabilities,
    settings = {
        Lua = {
            workspace = {
                library = {
                    vim.fn.expand('$VIMRUNTIME/lua'),
                    vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                    vim.fn.stdpath("data") .. "/plugged/nvim-cmp/lua/cmp/types"
                }
            }
        }
    }
}

lspconfig.basedpyright.setup {
    capabilities = nvim_cmp_capabilities,
}
