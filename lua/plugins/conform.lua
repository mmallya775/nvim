-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  ft = { "clojure", "clojurescript", "edn" },
  config = function()
    local conform = require("conform")
    
    conform.setup({
      formatters_by_ft = {
        clojure = { "cljfmt" },
        clojurescript = { "cljfmt" },
        edn = { "cljfmt" },
      },
      
      -- NO format on save
      format_on_save = nil,
    })
    
    -- Manual format keybindings
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })
  end,
}
