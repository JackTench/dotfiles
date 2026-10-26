local M = {}

-- Open a terminal at the bottom of the screen.
-- <Esc><Esc> stops insert mode.
-- Then use :q to close.
function M.open_terminal()
	-- Unlisted so barbar ignores it, wiped on close so no zsh buffer lingers.
	local buf = vim.api.nvim_create_buf(false, false)
	vim.cmd("botright split")
	vim.api.nvim_win_set_buf(0, buf)
	vim.fn.jobstart(vim.o.shell, { term = true })
	vim.bo[buf].bufhidden = "wipe"
	vim.cmd.startinsert()
end

return M
