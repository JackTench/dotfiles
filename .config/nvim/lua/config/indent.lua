local M = {}

-- Toggle function to switch spacing between 2/4.
function M.toggle_indent()
	local size = vim.fn.shiftwidth() == 4 and 2 or 4

	vim.bo.shiftwidth = size
	vim.bo.tabstop = size
	vim.bo.softtabstop = size

	vim.notify(("Indent: %d spaces"):format(size))
end

return M
