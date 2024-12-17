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

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function ()
        vim.lsp.buf.document_highlight()
    end
})

vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function ()
        vim.lsp.buf.clear_references()
    end
})

local installled_servers = (function ()
    local status, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not status then
        return {}
    end
    local installed_server_table = {}
    for _, server_name in pairs(mason_lspconfig.get_installed_servers()) do
        installed_server_table[server_name] = "installed"
    end
    return installed_server_table
end)()

local function config_server(server_name, config)
    if installled_servers[server_name] == "installed" then
        lspconfig[server_name].setup(config)
    end
end

local nvim_cmp_capabilities = cmp_lsp.default_capabilities()

config_server("lua_ls", {
    capabilities = nvim_cmp_capabilities,
    settings = {
        Lua = {
            workspace = {
                library = {
                    vim.fn.expand('$VIMRUNTIME/lua'),
                    vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                }
            }
        }
    }
})

config_server("basedpyright", {
    capabilities = nvim_cmp_capabilities,
})

config_server("lemminx", {
    capabilities = nvim_cmp_capabilities,
})

config_server("ts_ls", {
    capabilities = nvim_cmp_capabilities,
})
