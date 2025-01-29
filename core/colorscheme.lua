-- set colorscheme with protected call
-- in case it isn't installed
local colStatus, colors = pcall(require, "vscode.colors")
local themeStatus, theme = pcall(require, "vscode")
if not (colStatus and themeStatus) then
    return print("Colorscheme not found!")
end

local colorizerStatus, colorizer = pcall(require, "colorizer")
if not colorizerStatus then
    return print("colorizer not installed")
end


theme.setup({
    italic_comments = true,
})

theme.load()

colorizer.setup({
    filetypes = { "*" },
    user_default_options = {
        mode = "virtualtext",
        vitualtext_inline = "after"
    }
})

-- netrw hightlights
vim.api.nvim_set_hl(0, "netrwMarkFile", { underline = true, fg = "#ce9178" })
vim.api.nvim_set_hl(0, "netrwCopyTgt", { bg = "#ce9178" })
