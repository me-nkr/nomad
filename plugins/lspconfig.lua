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

local default_configs = {
        capabilities = nvim_cmp_capabilities,
        on_attach = function(client, bufnr)
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
}

local function mergeTables(tableOne, tableTwo)
  local tableFinal = {}
  for key, value in pairs(tableOne) do tableFinal[key] = value end
  for key, value in pairs(tableTwo) do tableFinal[key] = value end
  return tableFinal
end

vim.lsp.config("lua_ls", mergeTables(default_configs, {
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
}))

vim.lsp.config("basedpyright", mergeTables(default_configs, {
    settings = {
        basedpyright = {
            typeCheckingMode = "standard"
        }
    }
}))

mason.setup()
mason_lspconfig.setup()
