return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      -- ...
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = true, -- Non focused panes set to alternative background
    })
    -- vim.cmd("colorscheme github_light")
    --
    -- vim.api.nvim_set_hl(0, "Comment", {
    -- 	fg = "#988683", -- your desired color (e.g., a bright orange)
    -- 	italic = false,
    -- })
  end,
}
