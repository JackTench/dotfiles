return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		-- Use treesitter to avoid pairing inside strings/comments.
		check_ts = true,
	},
}
