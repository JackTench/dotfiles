-- Jack Tench 2025
-- neovim config

local M = {}

local function get_project_type()
	-- Check for Rust project.
	local rust_root = vim.fs.find("Cargo.toml", {
		upward = true,
		stop = vim.loop.os_homedir(),
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
	})[1]

	if rust_root then
		return "rust"
	end

	-- Check for Node.js project.
	local node_root = vim.fs.find("package.json", {
		upward = true,
		stop = vim.loop.os_homedir(),
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
	})[1]

	if node_root then
		return "node"
	end
	
	return nil
end

M.get_project_type = get_project_type

return M
