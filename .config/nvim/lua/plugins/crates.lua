return {
	"saecki/crates.nvim",
	-- Lazy load when reading Rust cargo files.
	event = {
		"BufRead Cargo.toml",
	},
	config = function()
		require("crates").setup()
	end,
}
