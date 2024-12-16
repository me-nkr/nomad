-- utils
require("nomad.utils.reload")
require("nomad.utils.scratchpad")

-- vim plug
require("nomad.pluginit")

-- configs
require("nomad.core.options")

-- colorschemes
require("nomad.core.colorscheme")

-- keymaps
require("nomad.core.keymaps")


-- plugin configs
require("nomad.plugins.treesitter")
require("nomad.plugins.mason")
require("nomad.plugins.lspconfig")
require("nomad.plugins.autocomplete.plugins")
require("nomad.plugins.autocomplete.nvimcmp")
