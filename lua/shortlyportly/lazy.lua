-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "shortlyportly.plugins" }, { import = "shortlyportly.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

vim.cmd.colorscheme("astrodark") -- Replace "gruvbox" with your color scheme name

-- Change the theme comment colour from gray (tricky to read) to red.
vim.api.nvim_set_hl(0, "Comment", { fg = "#8FEB34" })
