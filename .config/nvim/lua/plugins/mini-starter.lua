return {
	"nvim-mini/mini.starter",
	version = false,
	-- Only load when nvim is started without file arguments.
	cond = function()
		return vim.fn.argc() == 0
	end,
	config = function()
		local starter = require("mini.starter")
		starter.setup({
			content_hooks = {
				-- Replace blank character with bullet points.
				starter.gen_hook.adding_bullet("• "),
				starter.gen_hook.aligning("center", "center"),
			},
		})
	end,
}
