-- Setup.
local default_opts = {
	silent = false
}
local map = vim.api.nvim_set_keymap

-- Set leader key as spacebar.
vim.g.mapleader = " "

-- Binds/maps.
map("n", "<leader>so", ":source $MYVIMRC<CR>", default_opts)
map("n", "<leader>ra", ":Ranger<CR>", default_opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", default_opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", default_opts)

-- LSP keymaps. (buffer-local, only set once a server attaches)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			buffer = ev.buf,
			desc = "LSP: Go to definition",
		})
	end,
})
