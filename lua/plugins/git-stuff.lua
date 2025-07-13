return {
	{
		"tpope/vim-fugitive",
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "preview hunks" })
			vim.keymap.set(
				"n",
				"<leader>gt",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "toggles inline blame" }
			)

			vim.keymap.set("n", "<leader>gl", function()
				local line = vim.fn.line(".")
				local file = vim.fn.expand("%")
				vim.cmd("Git log -L " .. line .. "," .. line .. ":" .. file)
			end, { desc = "git log for current line" })
      vim.keymap.set("n", "<leader>gg", ":Git log %<CR>", { desc = "git log for whole file" })
		end,
	},
}
