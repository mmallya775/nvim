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
			highlights = {},
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
