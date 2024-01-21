-- Jack Tench 2023
-- neovim config
-- init.lua

-- Load package manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load opts file.
require("options")

-- Load plugins file.
require("lazy").setup("plugins")

-- Load LSP stuff.
require("lsp-config")
