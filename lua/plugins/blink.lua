return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- LazyVim appends to sources.default instead of replacing it,
      -- so filter "buffer" out of the existing list
      opts.sources.default = vim.tbl_filter(function(source)
        return source ~= "buffer"
      end, opts.sources.default or {})

      return vim.tbl_deep_extend("force", opts, {
        completion = {
          list = {
            selection = { preselect = false },
          },
          ghost_text = { enabled = false },
          menu = {
            max_height = 10,
          },
        },

        sources = {
          providers = {
            lsp = {
              score_offset = 10,
              -- drop plain-word "Text" items some LSPs return
              transform_items = function(_, items)
                local Text = require("blink.cmp.types").CompletionItemKind.Text
                return vim.tbl_filter(function(item)
                  return item.kind ~= Text
                end, items)
              end,
            },
            snippets = {
              score_offset = -10,
            },
          },
        },
      })
    end,
  },
}
