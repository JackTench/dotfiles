-- Jack Tench 2024
-- neovim config

-- Returns a list of plugins to the package manager.
return {

	-- Nord colour theme.
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end
	},

	-- Install folke's experimental UI.
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		}
	},

	-- Dressing UI plugin.
	{
		"stevearc/dressing.nvim"
	},

	-- Dashboard (doom emacs)
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("dashboard").setup({
				shortcut_type = "number"
			})
		end
	},

	-- LuaLine
	-- TODO: Replace this with GalaxyLine?
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = "nord"
			})
		end
	},

	-- Tabbed layout.
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {}
	},

	-- Scroll bar.
	{
		"dstein64/nvim-scrollview"
	},

	-- Highlight searching.
	{
		"rktjmp/highlight-current-n.nvim"
	},

	-- Prettier syntax highlighting.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- Handle treesitter config below.
		-- TODO: Move this to another file and de-ugly.
		config = function()
			require("nvim-treesitter.configs").setup {
				sync_install = false,
				auto_install = true,
				ignore_install = { "toml" },
				highlight = {
					enable = true
				}
			}
		end
	},

	-- HTML colour code highlighting.
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},

	-- Make it rain plugin.
	{
		"eandrju/cellular-automaton.nvim",
		-- Lazy load on CellularAutomaton command.
		cmd = { "CellularAutomaton" }
	},

	{
		"alec-gibson/nvim-tetris",
		-- Lazy load on Tetris command.
		cmd = { "Tetris" }
	},

	-- Ranger file manager.
	{
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({ enable_cmds = true })
		end,
		-- Lazy load on Ranger command.
		cmd = { "Ranger" }
	},

	-- Fuzzy finder.
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		-- Lazy load on Telescope command.
		cmd = { "Telescope" }
	},

	-- Keybind finder.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	-- LazyGit.
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		-- Lazy load on LazyGit command.
		cmd = { "LazyGit" }
	},

	-- VimTeX for auto-compiling LaTeX documents.
	{
		"lervag/vimtex",
		-- Lazy load when opening LaTeX documents.
		ft = { "tex" }
	},

	-- Preview markdown files.
	{
		"iamcco/markdown-preview.nvim",
		-- Lazy load on given commands whilst in markdown documents.
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownpreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end
	},

	-- Manage Cargo dependencies in Rust.
	{
		"saecki/crates.nvim",
		-- Lazy load when editing Rust cargo files.
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end
	},

	-- Auto close brackets, etc.
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end
	},

	-- Auto commenting keybinds.
	{
		"numToStr/Comment.nvim"
	},

	-- Mouse hover hints from LSP.
	{
		"soulis-1256/eagle.nvim",
		config = function()
			require("eagle").setup()
		end
	},

	-- Opening the wrong file. (Fuzzy finding?)
	{
		"mong8se/actually.nvim"
	},

}
