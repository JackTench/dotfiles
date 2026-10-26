return {
	"soulis-1256/eagle.nvim",
	event = "LspAttach",
	opts = {},
	config = function(_, opts)
		require("eagle").setup(opts)
	end,
}
