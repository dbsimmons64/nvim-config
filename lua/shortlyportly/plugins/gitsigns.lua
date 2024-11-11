return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>Gs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>Gr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>Gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<leader>Gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>GS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>GR", gs.reset_buffer, "Reset buffer")

			map("n", "<leader>Gu", gs.undo_stage_hunk, "Undo stage hunk")

			map("n", "<leader>Gp", gs.preview_hunk, "Preview hunk")

			map("n", "<leader>Gb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>GB", gs.toggle_current_line_blame, "Toggle line blame")

			map("n", "<leader>Gd", gs.diffthis, "Diff this")
			map("n", "<leader>GD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
