return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "warmer",
      transparent = false,

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
        background = true, -- tinted virtual-text backgrounds
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
