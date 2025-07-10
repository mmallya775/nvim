return {
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "dark",
				code_style = {
					comments = "none",
					keywords = "bold",
					functions = "none",
					strings = "none",
					variables = "none",
				},
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
}
