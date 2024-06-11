-- Jack Tench 2024
-- neovim config

local opt = vim.opt

-- Indent settings.
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Line numbers.
opt.number = true
opt.relativenumber = false

-- Mouse support
opt.mousemoveevent = true

-- VimTeX config.
vim.g.vimtex_view_method = "zathura"
