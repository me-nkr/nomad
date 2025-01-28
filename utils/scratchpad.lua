-- utility function to open a scratch window

vim.api.nvim_create_user_command('SP', function(filetype)
    local filetype = filetype.fargs[1]
    filetype = filetype or "markdown"
    if vim.v.vim_did_enter == 1 then
        vim.cmd("tabnew")
    end
    vim.opt.swapfile = false
    vim.opt.buftype = "nofile"
    vim.opt.bufhidden = "hide"
    vim.opt.filetype = filetype
end, {nargs = "?", complete = "filetype"})
