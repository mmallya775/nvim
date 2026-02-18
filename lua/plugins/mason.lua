return {

  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },

    config = function()
      -- Mason
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clojure_lsp" },
      handlers = {
        function(server_name)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
      -- skip clojure_lsp
      -- ["clojure_lsp"] = function() end,
    },
    dependencies = {},
  },
}
