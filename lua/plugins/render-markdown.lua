return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown",
  ft = "markdown",
  opts = {
    start_enabled = true,
    always_render = false,
  },
  config = function(_, opts)
    local rm = require("render-markdown")
    rm.setup(opts)

    -- Optional keymap to toggle rendering
    vim.keymap.set("n", "<leader>rm", rm.toggle, { desc = "Toggle Markdown Rendering" })
  end,
}
