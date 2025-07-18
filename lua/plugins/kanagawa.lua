return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = false, -- enable undercurls
			commentStyle = { italic = false, bold = true },
			functionStyle = {},
			keywordStyle = { italic = false, bold = true },
			statementStyle = { italic = false, bold = true },
			typeStyle = { italic = false },
			transparent = false, -- do not set background color
			dimInactive = true,
			-- theme = "lotus",
		})


		-- Then override the Comment highlight group
		vim.api.nvim_set_hl(0, "Comment", {
			fg = "#988683", -- your desired color (e.g., a bright orange)
			italic = false,
		})
		-- vim.cmd.colorscheme("kanagawa")

		-- Remove italics from vimOption
		vim.api.nvim_set_hl(0, "vimOption", { italic = false })
	end,
}
