-- function to calculate tabline text

vim.api.nvim_create_user_command('TRename', function(tabname)
    local tabname = tabname.fargs[1]
    if not tabname then
        return vim.api.nvim_err_writeln("No new tab name supplied")
    end

    vim.t.tabname = tabname
    vim.cmd("redrawtabline")
end, { nargs = "?" })

function TabLine()

    local s = ''

    for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do

        local tab_number = vim.api.nvim_tabpage_get_number(tabid)
        local windows = vim.api.nvim_tabpage_list_wins(tabid)
        local mod = (
            function()
                for _, winid in ipairs(windows) do
                    if vim.fn.getbufvar(vim.api.nvim_win_get_buf(winid), "&mod") == 1 then
                        return true
                    end
                end
                return false
            end
        )()

        if tabid == vim.api.nvim_get_current_tabpage() then
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end

        s = s .. '%' .. tabid .. 'T' .. ' [(' .. tab_number .. ') '

        local tabname = vim.t[tabid].tabname or vim.fn.fnamemodify(vim.fn.getcwd(-1, tab_number), ":t")

        s = s .. '%' .. tabid .. 'T' .. tabname .. ' <' .. #windows

        if mod then
            s = s .. "+"
        end

        s = s .. '>] '

    end

    s = s .. '%#TabLineFill#%T'

    if vim.fn.tabpagenr('$') > 1 then
        s = s .. '%=%#TabLine#%999XX'
    end

    return s
end

vim.o.tabline = "%!v:lua.TabLine()"
