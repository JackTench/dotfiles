-- Jack Tench 2023
-- neovim config
-- lsp-config.lua

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.nvim_workspace()
lsp.setup()
