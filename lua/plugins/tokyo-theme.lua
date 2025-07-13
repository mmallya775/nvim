return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

  config = function()
    require("tokyonight").setup({
      styles = {
        comments = { italic = false, bold = true },
      },
      on_highlights = function(highlights, colors)
        highlights.Comment = {
          fg = '#878686', -- your desired color (e.g., a bright orange)
          bold = true,
        }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
