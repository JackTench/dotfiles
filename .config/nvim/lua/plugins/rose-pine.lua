return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			highlight_groups = {
				-- folke/noice.nvim
				NoiceCmdlineIcon = { fg = "foam" },
				NoiceCmdlineIconSearch = { fg = "gold" },
				NoiceCmdlinePopupBorder = { fg = "muted" },
				NoiceCmdlinePopupBorderSearch = { fg = "gold" },
				NoiceCmdlinePopupTitle = { fg = "foam", bold = true },
				NoiceConfirmBorder = { fg = "muted" },
			},
		})
		vim.cmd("colorscheme rose-pine")
	end
}
