return {
	"kelly-lin/ranger.nvim",
	cmd = { "Ranger" },
	config = function()
		require("ranger-nvim").setup({
			enable_cmds = true
		})
	end,
}
