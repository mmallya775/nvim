return {
  {
    "julienvincent/nvim-paredit",
    opts = function(_, opts)
      local paredit = require("nvim-paredit")

      -- Disable Paredit's default mappings so normal Vim motions
      -- such as W, B, E, ( and ) remain unchanged.
      opts.use_default_keys = false

      -- Enable only for Clojure files.
      opts.filetypes = { "clojure" }

      opts.cursor_behaviour = "auto"

      -- Re-indent forms after slurping or barfing.
      opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
        enabled = true,
      })

      opts.keys = {
        ["<leader>psf"] = {
          paredit.api.slurp_forwards,
          "Paredit: Slurp forward",
        },

        ["<leader>psb"] = {
          paredit.api.slurp_backwards,
          "Paredit: Slurp backward",
        },

        ["<leader>pbf"] = {
          paredit.api.barf_forwards,
          "Paredit: Barf forward",
        },

        ["<leader>pbb"] = {
          paredit.api.barf_backwards,
          "Paredit: Barf backward",
        },

        ["<leader>psp"] = {
          paredit.unwrap.unwrap_form_under_cursor,
          "Paredit: Splice form",
        },

        ["<leader>prf"] = {
          paredit.api.raise_form,
          "Paredit: Raise form",
        },
      }
      return opts
    end,
  },
}
