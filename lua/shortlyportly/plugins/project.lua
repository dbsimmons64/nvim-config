return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- Custom configurations go here
			manual_mode = false,
			detection_methods = { "lsp", "pattern" }, -- Use LSP and pattern detection
			patterns = { ".git", "Makefile", "package.json" }, -- Project root patterns
		})

		-- Optionally integrate with telescope.nvim to browse projects
		require("telescope").load_extension("projects")
	end,
}
