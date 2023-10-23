-- set colorscheme with protected call
-- in case it isn't installed
local colStatus, colors = pcall(require, "vscode.colors")
local themeStatus, theme = pcall(require, "vscode")

if not (colStatus and themeStatus) then
    print("Colorscheme not found!")
    return
end

theme.setup({
    italic_comments = true,
})
theme.load()
