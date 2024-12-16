-- import cmp-plugins plugin safely
local status, cmp_plugins = pcall(require, "cmp-plugins")
if not status then
  return print("cmp-plugins not installed")
end

-- configure cmp-plugins
cmp_plugins.setup({
    files = { "pluginit.lua" }
})
