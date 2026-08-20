return {
  {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      local icons = LazyVim.config.icons

      ----------------------------------------------------------------------
      -- LSP
      ----------------------------------------------------------------------

      local function lsp_clients()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local names = {}

        for _, client in ipairs(clients) do
          -- Don't count Copilot as the language LSP.
          if client.name ~= "copilot" then
            table.insert(names, client.name)
          end
        end

        if #names == 0 then
          return ""
        end

        table.sort(names)

        return " " .. table.concat(names, ", ")
      end

      local function has_lsp()
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
          if client.name ~= "copilot" then
            return true
          end
        end

        return false
      end

      ----------------------------------------------------------------------
      -- Current symbol / function
      ----------------------------------------------------------------------

      local function navic_location()
        local ok, navic = pcall(require, "nvim-navic")

        if not ok or not navic.is_available() then
          return ""
        end

        return navic.get_location({
          highlight = false,
          separator = " › ",
          depth_limit = 3,
        })
      end

      local function has_navic()
        local ok, navic = pcall(require, "nvim-navic")

        return ok and navic.is_available()
      end

      ----------------------------------------------------------------------
      -- Theme
      ----------------------------------------------------------------------

      opts.options.theme = "auto"

      -- Less Powerline, more traditional modeline.
      opts.options.section_separators = {
        left = "",
        right = "",
      }

      opts.options.component_separators = {
        left = "│",
        right = "│",
      }

      ----------------------------------------------------------------------
      -- Sections
      ----------------------------------------------------------------------

      opts.sections = {
        --------------------------------------------------------------------
        -- Left
        --------------------------------------------------------------------

        lualine_a = {
          {
            "mode",
          },
        },

        lualine_b = {
          {
            "branch",
          },

          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },

        lualine_c = {
          -- Project/root directory
          LazyVim.lualine.root_dir(),

          -- Current file path
          {
            LazyVim.lualine.pretty_path(),
          },

          -- Clojure function / Java method / etc.
          {
            navic_location,
            cond = has_navic,
            padding = {
              left = 1,
              right = 1,
            },
          },
        },

        --------------------------------------------------------------------
        -- Right
        --------------------------------------------------------------------

        lualine_x = {
          {
            "diff",

            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },

            source = function()
              local gitsigns = vim.b.gitsigns_status_dict

              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },

          -- clojure_lsp / jdtls / lua_ls / etc.
          {
            lsp_clients,
            cond = has_lsp,
          },

          {
            "filetype",
            icon_only = false,
          },
        },

        lualine_y = {
          {
            "progress",
            separator = " ",
            padding = {
              left = 1,
              right = 0,
            },
          },

          {
            "location",
            padding = {
              left = 0,
              right = 1,
            },
          },
        },

        lualine_z = {
          {
            function()
              return " " .. os.date("%Y-%m-%d") .. "   " .. os.date("%H:%M")
            end,
          },
        },
      }

      ----------------------------------------------------------------------
      -- Inactive windows
      ----------------------------------------------------------------------

      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {},
        lualine_y = {
          "location",
        },
        lualine_z = {},
      }

      return opts
    end,
  },
}
