return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = false,
      },

      servers = {
        clojure_lsp = {},
      },
    },
  },
}
