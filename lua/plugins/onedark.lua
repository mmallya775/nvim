return {
  -- Using Lazy
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "light",
        code_style = {
          comments = "bold",
          keywords = "bold",
          functions = "bold",
          strings = "none",
          variables = "none",
        },
      })
      -- Enable theme
      require("onedark").load()
    end,
  },
}
