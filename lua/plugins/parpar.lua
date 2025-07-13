--- Paredit + Parinfer thingy
return {
	"dundalek/parpar.nvim",
	dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
	opts = {},

	config = function()
		local paredit = require("nvim-paredit")

		require("parpar").setup({

			paredit = {
				-- pass any nvim-paredit options here
				keys = {
					-- custom bindings are automatically wrapped
					["<leader>sb"] = { paredit.api.slurp_backwards, "Slurp backwards" },
					["<leader>bb"] = { paredit.api.barf_backwards, "Barf backwards" },
					["<leader>sf"] = { paredit.api.barf_forwards, "Barf forwards" },
					["<leader>bf"] = { paredit.api.slurp_forwards, "Slurp forwards" },
				},
			},
		})
	end,
}
