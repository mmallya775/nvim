return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    keys = {
      {
        "<leader>wp",
        function()
          local win = require("window-picker").pick_window()
          if win then
            vim.api.nvim_set_current_win(win)
          end
        end,
        desc = "Pick Window",
      },
    },
    opts = {
      hint = "floating-big-letter",
      selection_chars = "ASDFGHJKL",
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = {
            "notify",
            "snacks_notif",
          },
          buftype = {
            "prompt",
            "quickfix",
          },
        },
      },
    },
  },
}
