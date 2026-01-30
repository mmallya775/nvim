return {
	"nvim-neo-tree/neo-tree.nvim",
	--branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	opts = {},

	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
			window = {
				position = "left", -- always open on the left
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree toggle left reveal<CR>", { noremap = true, silent = true })
	end,
}
