-- Setup.
local default_opts = {
	silent = false
}
local map = vim.api.nvim_set_keymap

-- Set leader key as spacebar.
vim.g.mapleader = " "

-- Binds/maps.
map("n", "<leader>so", ":source $MYVIMRC<CR>", default_opts)
local indent = require("config/indent")
map("n", "<leader>id", "", vim.tbl_extend("force", default_opts, {
	callback = indent.toggle_indent
}))
map("n", "<leader>laz", ":Lazy<CR>", default_opts)
local terminal = require("config/terminal")
map("n", "<leader>ter", "", vim.tbl_extend("force", default_opts, {
	callback = terminal.open_terminal
}))
map("t", "<Esc><Esc>", "<C-\\><C-n>", default_opts)
map("n", "<leader>ra", ":Ranger<CR>", default_opts)
map("n", "<leader>gg", ":LazyGit<CR>", default_opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", default_opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", default_opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", default_opts)

-- LSP keymaps. (buffer-local, only set once a server attaches)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			buffer = ev.buf,
			desc = "LSP: Go to definition",
		})
	end,
})
