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

local function open_hello_world_popup()
	-- Define the message and window dimensions
	local message = "Hello, World!"
	local width = #message + 4
	local height = 3

	-- Calculate the window position to center it on the screen
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Configure window options
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "single",
	}

	-- Create a buffer for the floating window
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "", " " .. message, "" })

	-- Open the floating window
	vim.api.nvim_open_win(buf, true, opts)
end

-- Command to trigger the popup
vim.api.nvim_create_user_command("HelloWorldPopup", open_hello_world_popup, {})
