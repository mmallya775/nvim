return {
  {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },

    opts = {
      parser = {
        delimiter = {
          -- Don't force .csv = comma.
          -- Let it detect semicolon/pipe/etc too.
          ft = {
            tsv = "\t",
          },

          fallbacks = {
            ",",
            "\t",
            ";",
            "|",
            ":",
            " ",
          },
        },
      },

      view = {
        display_mode = "border",
        spacing = 2,
      },

      keymaps = {
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },

        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      },
    },
  },
}
