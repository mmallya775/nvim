return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "warmer", -- dark, darker, cool, deep, warm, warmer, light

      transparent = false,
      term_colors = true,

      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
