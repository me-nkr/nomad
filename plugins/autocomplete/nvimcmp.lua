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


-- configure nvim-cmp
cmp.setup({
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "nvim_lua" },
            { name = "treesitter" },
            { name = "plugins" },
            { name = "nvim_lsp_signature_help" }
        },
        {
            {
                name = "buffer",
                option = {
                    get_bufnrs = function () return vim.api.nvim_list_bufs() end
                }
            },
            { name = "path" }
        }
    ),
    snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-l>"] = cmp.mapping.open_docs(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
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
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline"}
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
