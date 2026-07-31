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
        ["<C-f>"] = {
          paredit.api.move_to_next_element_head,
          "Paredit: Next element",
          repeatable = false,
          mode = { "n", "x", "o", "v" },
        },

        ["<C-b>"] = {
          paredit.api.move_to_prev_element_head,
          "Paredit: Previous element",
          repeatable = false,
          mode = { "n", "x", "o", "v" },
        },
        -- Structural motions used by deletion operators.
        ["E"] = {
          paredit.api.move_to_next_element_tail,
          "Paredit: Next element tail",
          repeatable = false,
          mode = { "o" },
        },

        ["B"] = {
          paredit.api.move_to_prev_element_head,
          "Paredit: Previous element head",
          repeatable = false,
          mode = { "o" },
        },

        -- Kill sexp forward.
        ["<M-d>"] = {
          function()
            vim.api.nvim_feedkeys("dE", "m", false)
          end,
          "Paredit: Kill sexp forward",
          mode = { "n" },
        },

        -- Kill sexp backward.
        ["<M-BS>"] = {
          function()
            vim.api.nvim_feedkeys("dB", "m", false)
          end,
          "Paredit: Kill sexp backward",
          mode = { "n" },
        },
      }
      return opts
    end,
  },
}
