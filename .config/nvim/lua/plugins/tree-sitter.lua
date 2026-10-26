return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		local available = ts.get_available()
		local installing = {}

		local function start(buf, lang)
			if not vim.api.nvim_buf_is_valid(buf) then
				return false
			end
			if pcall(vim.treesitter.start, buf, lang) then
				-- Disable regex highlighting where treesitter is active.
				vim.bo[buf].syntax = ""
				return true
			end
			return false
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				if not lang or start(ev.buf, lang) then
					return
				end

				-- No parser yet: install it.
				if vim.tbl_contains(available, lang) and not installing[lang] then
					installing[lang] = true
					ts.install(lang):await(function()
						installing[lang] = nil
						start(ev.buf, lang)
					end)
				end
			end,
		})
	end,
}
