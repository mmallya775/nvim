return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

  config = function()
    require("tokyonight").setup({
      dim_inactive = true, -- dims inactive windows
      lualine_bold = true,
      styles = {
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
        comments = { italic = false, bold = true },
      },
      on_highlights = function(highlights, colors)
        highlights.Comment = {
          fg = "#878686", -- your desired color (e.g., a bright orange)
          bold = true,
        }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
