return {
  {
    "nvim-mini/mini.pairs",
    opts = {
      skip_unbalanced = true,
    },
    config = function(_, opts)
      LazyVim.mini.pairs(opts)

      local function map_pair_backspace(key)
        vim.keymap.set("i", key, "v:lua.MiniPairs.bs()", {
          expr = true,
          replace_keycodes = false,
          desc = "Pair-aware backspace",
        })
      end

      map_pair_backspace("<BS>")
      map_pair_backspace("<C-h>")
    end,
  },
}
