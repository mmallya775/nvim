return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim",
	},
	opts = {

		ensure_installed = {
			"stylua",
			"clj_kondo",
			"cljfmt",
			"gofmt",
			"goimports",
			"goimports_reviser",
			"golines",
			"prettier",
			"spell",
			"sqlfmt",
			"eslint_d",
		},
		automatic_installation = true,
		automatic_setup = true,
	},
}
