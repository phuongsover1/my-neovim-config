require("gitsigns").setup({
	current_line_blame = true,
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })
		-- Actions
		map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "State Hunk" })
		map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>gS", gs.stage_buffer, { remap = true, desc = "Stage Buffer" })
		map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
		map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Hunk" })
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame Line" })
		map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
		map("n", "<leader>gd", gs.diffthis, { desc = "Diff This" })
		map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
