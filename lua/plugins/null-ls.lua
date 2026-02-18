return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		-- Null ls related stuff
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.completion.spell,
				-- null_ls.builtins.diagnostics.clj_kondo,
				null_ls.builtins.formatting.cljfmt,
				-- null_ls.builtins.diagnostics.golangci_lint,
				-- null_ls.builtins.code_actions.gomodifytags,
				-- null_ls.builtins.code_actions.impl,
				-- null_ls.builtins.code_actions.refactoring,
				-- null_ls.builtins.formatting.gofmt,
				-- null_ls.builtins.formatting.goimports,
				-- null_ls.builtins.formatting.goimports_reviser,
				-- null_ls.builtins.formatting.golines,
				-- -- null_ls.builtins.formatting.sqlfmt,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})
		--keymaps for null ls related stuff
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
