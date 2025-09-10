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
			map("n", "]h", gs.next_hunk, "Next [H]unk")
			map("n", "[h", gs.prev_hunk, "Prev [H]unk")

			-- Actions
			map("n", "<leader>hs", gs.stage_hunk, "[H]unk [S]tage")
			map("n", "<leader>hr", gs.reset_hunk, "[H]unk [R]eset")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "[H]unk [S]tage")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "[H]unk [R]eset")

			map("n", "<leader>hS", gs.stage_buffer, "[H]unk [S]tage Buffer")
			map("n", "<leader>hR", gs.reset_buffer, "[H]unk [R]eset Buffer")

			map("n", "<leader>hu", gs.undo_stage_hunk, "[H]unk [U]ndo Stage")

			map("n", "<leader>hp", gs.preview_hunk, "[H]unk [P]review")

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "[H]unk [B]lame Line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "[H]unk Toggle [B]lame Line")

			map("n", "<leader>hd", gs.diffthis, "[H]unk [D]iff This")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "[H]unk [D]iff This ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns Select Hunk")
		end,
	},
}
