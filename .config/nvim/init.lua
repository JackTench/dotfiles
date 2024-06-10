-- Jack Tench 2024
-- neovim config

require("user/options")
require("user/maps")

-- Install package manager and plugins.
require("lazy/bootstrap")
require("lazy").setup("plugins")

-- Load LSP config.
require("user/lsp")
