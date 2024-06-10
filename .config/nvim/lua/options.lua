-- Jack Tench 2023
-- neovim config
-- options.lua

-- Clean up code.
local opt = vim.opt

-- Indent settings.
opt.shiftwidth = 4
opt.tabstop = 4

-- Line numbers
opt.number = true
opt.relativenumber = false

-- VimTeX config.
vim.g.vimtex_view_method = "zathura"
