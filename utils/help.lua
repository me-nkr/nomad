-- utility function to show keymaps

vim.api.nvim_create_user_command("HELP", function()
    
    local padding = 4

    local buffer = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_keymap(buffer, 'n', "q", ":close<CR>", { noremap = true, silent = true, nowait = true })

    local keymap_lines = vim.tbl_map(function(map)

        local lhs = map.lhs:gsub(" ", "<Space>")
        local rhs = map.rhs ~= nil and map.rhs or tostring(map.callback)
        local description = map.desc ~= nil and map.desc or rhs

        return string.rep(" ", 10)..lhs..string.rep(" ", 40 - #lhs)..description

    end, vim.tbl_filter(function(filter) return filter.lnum == 0 end, vim.api.nvim_get_keymap("n")))

    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, keymap_lines)

    vim.bo[buffer].modifiable = false
    vim.bo[buffer].readonly = true
    vim.bo[buffer].filetype = "lua"

    local ui = vim.api.nvim_list_uis()[1]

    local options = {
        relative = "editor",
        height = ui.height - padding,
        width = ui.width - padding,
        row = padding / 2,
        col = padding / 2,
        anchor = "NW",
        style = "minimal",
        border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
        title = "Help"
    }

    vim.api.nvim_open_win(buffer, true, options)
end, {})
