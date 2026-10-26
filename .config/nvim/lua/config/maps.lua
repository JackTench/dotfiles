-- Setup.
local default_opts = {
	silent = false
}
local map = vim.api.nvim_set_keymap

-- Set leader key as spacebar.
vim.g.mapleader = " "

-- Binds/maps.
map("n", "<leader>so", ":source $MYVIMRC<CR>", default_opts)
