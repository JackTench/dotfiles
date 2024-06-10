-- Jack Tench 2023
-- neovim config
-- plugins.lua

-- Returns a list of plugins to install back into init.lua
return {

	-- Install experimental UI plugin from folke.
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	
	-- Install nord colour scheme. 
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require 'nordic' .load()
		end,
	},
	
	-- Install LuaLine.
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = "nord",
			})
		end,
	},

	-- Install scroll bar.
	"dstein64/nvim-scrollview",

	-- Install tabbed layout.
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- TODO: Configure tabbed layout here.
		},
	},
	
	-- Install file browser.
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup{
				-- TODO: Configure?
			}
		end,
	},

	-- Install keybind viewer.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	-- Make searching look better.
	"rktjmp/highlight-current-n.nvim",

	-- LSP setup.
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{"hrsh7th/cmp-nvim-lsp"},
		}
	},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{"L3MON4D3/LuaSnip"}
		},
	},

	-- Syntax highlighting.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Install fuzzy finder.
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- LazyGit
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- VimTeX for auto-compiling LaTeX documents.
	{
		"lervag/vimtex",
	}
}
