return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	init = function()
		-- Load Telescope the first time anything asks for a selection.
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "telescope.nvim" } })
			return vim.ui.select(...)
		end
	end,
	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
