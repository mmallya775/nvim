return {
  {
    "tpope/vim-surround",

    init = function()
      vim.g.surround_no_mappings = 1
    end,

    config = function()
      vim.keymap.set("n", "gs", "<Plug>Ysurround", { remap = true })
      vim.keymap.set("n", "gS", "<Plug>YSurround", { remap = true })

      vim.keymap.set("n", "ds", "<Plug>Dsurround", { remap = true })
      vim.keymap.set("n", "cs", "<Plug>Csurround", { remap = true })
      vim.keymap.set("n", "cS", "<Plug>CSurround", { remap = true })

      vim.keymap.set("x", "S", "<Plug>VSurround", { remap = true })
    end,
  },
}
