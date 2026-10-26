return {
	"mason-org/mason-lspconfig.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	cmd = {
		"LspInstall",
		"LspUninstall",
	},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {},
}
