return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    --Lua-line setup
    require("lualine").setup({
      options = { theme = "catppuccin" },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
      inactive_sections = {
        lualine_c = { { "filename", path = 1 } },
      },
    })
  end,
}
