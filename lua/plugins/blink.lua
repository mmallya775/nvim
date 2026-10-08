return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },

        ghost_text = {
          enabled = false,
        },

        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
      },

      sources = {
        -- No automatic snippet suggestions
        default = { "lsp", "buffer", "path" },

        providers = {
          lsp = {
            fallbacks = {},

            transform_items = function(_, items)
              local kinds = require("blink.cmp.types").CompletionItemKind

              return vim.tbl_filter(function(item)
                return item.kind ~= kinds.Snippet and item.kind ~= kinds.Keyword
              end, items)
            end,
          },

          buffer = {
            min_keyword_length = 1,
            score_offset = -2,
          },
        },
      },
    },
  },
}
