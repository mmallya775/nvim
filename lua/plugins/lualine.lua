return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		--Lua-line setup
		require("lualine").setup({
			options = {
				theme = "onedark",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch", "diff" },
				lualine_c = {
					"%=", --[[ add your center components here in place of this comment ]]
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			-- sections = {
			-- 	lualine_c = { { "filename", path = 1 } },
			-- },
			-- inactive_sections = {
			-- 	lualine_c = { { "filename", path = 1 } },
			-- },
		})
	end,
}
