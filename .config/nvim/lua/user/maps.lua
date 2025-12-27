-- Jack Tench 2024
-- neovim config

local opts = { silent = true }

local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

map("n", "<leader>id", ":lua require('user/functions').toggle_indent()<CR>", opts)
map("n", "<leader>ra", ":Ranger<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>gg", ":LazyGit<CR>", opts)
map("n", "<leader>fml", ":CellularAutomaton make_it_rain<CR>", opts)
map("n", "<leader>ter", ":terminal<CR>", opts)
map("n", "<leader>fl", ":lua require('user/functions').format_code()<CR>", opts)
