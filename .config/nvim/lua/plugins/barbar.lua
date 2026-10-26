return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	init = function()
		vim.g.barbar_auto_setup = false

		-- Load barbar only once there are two or more listed buffers.
		-- VimEnter covers `nvim a b`, whose buffers exist before this runs.
		vim.api.nvim_create_autocmd({ "BufAdd", "VimEnter" }, {
			group = vim.api.nvim_create_augroup("BarbarLazyLoad", { clear = true }),
			callback = function()
				if #vim.fn.getbufinfo({ buflisted = 1 }) >= 2 then
					require("lazy").load({ plugins = { "barbar.nvim" } })
					return true -- delete this autocmd
				end
			end,
		})
	end,
	opts = {},
}
