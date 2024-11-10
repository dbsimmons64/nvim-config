return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"jfpedroza/neotest-elixir",
	},

	-- To ensure getcwd worked I had to install project.nvim.

	keys = {
		{ "<leader>Tt", ":lua require('neotest').run.run()<CR>", desc = "Run nearest test", mode = "n", silent = true },
		{
			"<leader>Tp",
			":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
			desc = "Run all test in project",
			mode = "n",
			silent = true,
		},
		{
			"<leader>Tf",
			":lua require('neotest').run.run(vim.api.nvim_buf_get_name(0))<CR>",
			desc = "Run all test in file",
			mode = "n",
			silent = true,
		},
		{
			"<leader>Td",
			":lua require('neotest').output.open()<CR>",
			desc = "Test Summary",
			mode = "n",
			silent = true,
		},
	},
	config = function()
		require("neotest").setup({

			adapters = {
				require("neotest-elixir"),
			},
		})
	end,
}
