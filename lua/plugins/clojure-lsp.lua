return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = true,
      },

      servers = {
        clojure_lsp = {},
      },
    },
  },
}
