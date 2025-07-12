return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",

	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				sort_by = "id",
			},
			highlights = {
				buffer_selected = {
					underline = true,
					underline_style = "undercurl",
					italic = false,
					bold = true,
					sp = "#ff0000", -- red underline color
					fg = "#000000", -- black text for contrast on light background
					bg = "#f0f0f0",
				},
			},
		})
		-- Set keymaps for cycling buffers
		vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
		for i = 1, 9 do
			vim.api.nvim_set_keymap(
				"n",
				"<leader>" .. i,
				":BufferLineGoToBuffer " .. i .. "<CR>",
				{ noremap = true, silent = true }
			)
		end
	end,
}
