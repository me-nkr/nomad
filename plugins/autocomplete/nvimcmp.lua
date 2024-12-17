-- import nvim-cmp plugin safely
local status, cmp = pcall(require, "cmp")
if not status then
  return print("nvim-cmp not installed")
end

local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
  return print("nvim-autopairs not installed")
end

local status, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
if not status then
  return print("nvim-autopairs-cmp not installed")
end

local status, lspkind = pcall(require, "lspkind")
if not status then
  return print("lspkind.nvim not installed")
end

-- configure nvim-cmp
cmp.setup({
    sources = cmp.config.sources(
        {
            { name = "path" },
            { name = "vsnip" },
            { name = "plugins" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "treesitter" },
            { name = "nvim_lsp_signature_help" }
        },
        {
            {
                name = "buffer",
                option = {
                    get_bufnrs = function () return vim.api.nvim_list_bufs() end
                }
            },
        }
    ),
    snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
    },
    experimental = {
        ghost_text = true
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)

            local kind = lspkind.cmp_format({
                mode = "symbol",
                maxwidth = 50,
                menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    vsnip = "[Vsnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                    treesitter = "[Treesitter]",
                    path = "[Path]",
                    plugins = "[Plugins]",
                    cmdline = "[Cmd]"
                })
            })(entry, vim_item)

            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "

            vim_item.dup = 0

            return kind
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-l>"] = cmp.mapping(function(fallback)
            if cmp.visible_docs() then
                cmp.close_docs()
            elseif cmp.visible() then
                cmp.open_docs()
            else
                fallback()
            end
        end),
        ["<C-b>"] = cmp.mapping.scroll_docs(4),
        ["<C-f>"] = cmp.mapping.scroll_docs(-4),
        ["<Space><Tab>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-j>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ["<C-k>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    })
})

autopairs.setup {}
cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(":", {
    experimental = {
        ghost_text = true
    },
    mapping = cmp.mapping.preset.cmdline({
        ["<C-n>"] = cmp.config.disable,
        ["<C-p>"] = cmp.config.disable,
    }),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline"},
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
