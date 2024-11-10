return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,

	opts = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>e", group = "NeoTree" },
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>h", group = "Git" },
			{ "<leader>n", group = "Clear Search" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>T", group = "Test" },
			{ "<leader>w", group = "Window" },
			{ "<leader>x", group = "Trouble" },
		})
	end,
}
