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

local server_configs = {}

local function config_server(server_name, settings)
    server_configs[server_name] = settings
end


config_server("lua_ls", {
        Lua = {
            workspace = {
                library = {
                    vim.fn.expand('$VIMRUNTIME/lua'),
                    vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                }
            }
    }
})

config_server("basedpyright", {
        basedpyright = {
            typeCheckingMode = "standard"
        }
})


mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    function (server_name)
        lspconfig[server_name].setup({
            capabilities = nvim_cmp_capabilities,
            settings = server_configs[server_name],
            on_attach = function (client, bufnr)

                if client.server_capabilities.documentHighlightProvider then

                    -- automatic hightlight and clear hightlight of tokens
                    local group = vim.api.nvim_create_augroup(
                        'LspDocumentHighlight' .. bufnr,
                        { clear = true }
                    )

                    vim.api.nvim_create_autocmd("CursorHold", {
                        callback = function()
                            vim.lsp.buf.document_highlight()
                        end,
                        group = group,
                        buffer = bufnr
                    })

                    vim.api.nvim_create_autocmd("CursorMoved", {
                        callback = function()
                            vim.lsp.buf.clear_references()
                        end,
                        group = group,
                        buffer = bufnr
                    })
                end
            end
        })
    end
}
