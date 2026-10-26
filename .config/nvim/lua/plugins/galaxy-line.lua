return {
	"NTBBloodbath/galaxyline.nvim",
	dependencies = {
		"rose-pine/neovim",
		{
			"nvim-tree/nvim-web-devicons",
			lazy = true,
		},
	},
	config = function()
		require("config/statusline")
	end,
}
