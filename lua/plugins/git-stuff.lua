return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			-- "nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({
      graphical_diff = true, -- This enables syntax highlighting in diffs
      })
		end,
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
		},
	},
}
