return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      no_italic = true,
      no_bold = false,
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        native_lsp = {
          enabled = true,
        },
        neotree = true,
        snacks = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
