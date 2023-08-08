-- utility function apply config without closing

vim.api.nvim_create_user_command('RC', function()
     for name,_ in pairs(package.loaded) do
         if name:match('^nomad') then
             package.loaded[name] = nil
         end
     end
 
     dofile(vim.env.MYVIMRC)
     vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})
