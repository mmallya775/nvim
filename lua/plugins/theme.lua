return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,

      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      functionStyle = {},
      typeStyle = {},

      transparent = false,
      dimInactive = false,
      terminalColors = true,

      theme = "dragon",

      background = {
        dark = "wave",
        light = "lotus",
      },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}
