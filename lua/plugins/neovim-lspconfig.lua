return {
	"neovim/nvim-lspconfig",

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configure hover handler with dark border
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
