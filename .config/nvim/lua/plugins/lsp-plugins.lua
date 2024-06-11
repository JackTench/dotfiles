-- Jack Tench 2024
-- neovim config

-- Returns a list of plugins to the package manager.
return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp"
		}
	},

	{
		"williamboman/mason.nvim"
	},

	{
		"williamboman/mason-lspconfig.nvim"
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip"
		}
	},

}
