return {
  {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      local colors = require("kanagawa.colors").setup({ theme = "wave" })
      local p = colors.palette

      local bar_bg = p.sumiInk0
      local text = p.oldWhite

      local function mode_theme(mode_color)
        return {
          a = {
            fg = bar_bg,
            bg = mode_color,
            gui = "bold",
          },
          b = {
            fg = text,
            bg = bar_bg,
          },
          c = {
            fg = text,
            bg = bar_bg,
          },
        }
      end

      local theme = {
        normal = mode_theme(p.peachRed),
        insert = mode_theme(p.autumnGreen),
        visual = mode_theme(p.crystalBlue),
        replace = mode_theme(p.waveRed),
        command = mode_theme(p.carpYellow),
        terminal = mode_theme(p.springGreen),

        inactive = {
          a = {
            fg = p.fujiGray,
            bg = bar_bg,
          },
          b = {
            fg = p.fujiGray,
            bg = bar_bg,
          },
          c = {
            fg = p.fujiGray,
            bg = bar_bg,
          },
        },
      }

      -- Display:
      -- project-name/path/to/current/file/directory/
      --
      -- Example:
      -- scada-monitor/src/scada_ui/etl/
      local function directory()
        local cwd = vim.fn.getcwd()
        local cwd_name = vim.fn.fnamemodify(cwd, ":t")
        local file = vim.api.nvim_buf_get_name(0)

        if cwd_name == "" then
          cwd_name = cwd
        end

        -- Unnamed buffers still show the current working directory.
        if file == "" then
          return " " .. cwd_name .. "/"
        end

        local file_dir = vim.fn.fnamemodify(file, ":p:h")
        local relative_dir = vim.fn.fnamemodify(file_dir, ":.")

        if relative_dir == "" or relative_dir == "." then
          return " " .. cwd_name .. "/"
        end

        return " " .. cwd_name .. "/" .. relative_dir .. "/"
      end

      local function lsp_clients()
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        if #clients == 0 then
          return ""
        end

        local names = {}

        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end

        return " " .. table.concat(names, ", ")
      end

      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        theme = theme,
        globalstatus = true,

        component_separators = {
          left = "",
          right = "",
        },

        section_separators = {
          left = "",
          right = "",
        },
      })

      opts.sections = {
        lualine_a = {
          {
            "mode",

            -- NORMAL -> Neovim icon + N
            fmt = function(mode)
              return " " .. mode:sub(1, 1)
            end,

            separator = {
              left = "",
              right = "",
            },

            padding = {
              left = 1,
              right = 1,
            },
          },
        },

        lualine_b = {},

        lualine_c = {
          {
            directory,

            cond = function()
              return vim.o.columns >= 100
            end,

            color = {
              fg = p.crystalBlue,
              bg = bar_bg,
            },

            padding = {
              left = 1,
              right = 0,
            },
          },

          {
            "filetype",
            icon_only = true,
            separator = "",

            color = {
              fg = p.surimiOrange,
              bg = bar_bg,
            },

            padding = {
              left = 1,
              right = 0,
            },
          },

          {
            "filename",
            path = 0,

            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },

            color = {
              fg = text,
              bg = bar_bg,
            },

            padding = {
              left = 1,
              right = 1,
            },
          },

          {
            "branch",
            icon = "",

            color = {
              fg = p.surimiOrange,
              bg = bar_bg,
            },

            padding = {
              left = 1,
              right = 1,
            },
          },

          {
            "diagnostics",

            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },

            diagnostics_color = {
              error = {
                fg = p.samuraiRed,
                bg = bar_bg,
              },
              warn = {
                fg = p.roninYellow,
                bg = bar_bg,
              },
              info = {
                fg = p.waveAqua1,
                bg = bar_bg,
              },
              hint = {
                fg = p.dragonBlue,
                bg = bar_bg,
              },
            },

            update_in_insert = false,
          },
        },

        lualine_x = {
          {
            lsp_clients,

            color = {
              fg = p.waveAqua2,
              bg = bar_bg,
            },

            padding = {
              left = 1,
              right = 1,
            },
          },

          {
            "diff",

            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },

            diff_color = {
              added = {
                fg = p.autumnGreen,
                bg = bar_bg,
              },
              modified = {
                fg = p.autumnYellow,
                bg = bar_bg,
              },
              removed = {
                fg = p.autumnRed,
                bg = bar_bg,
              },
            },
          },

          {
            "progress",

            color = {
              fg = p.springViolet2,
              bg = bar_bg,
            },

            padding = {
              left = 1,
              right = 1,
            },
          },

          {
            "location",

            color = {
              fg = p.crystalBlue,
              bg = bar_bg,
            },

            padding = {
              left = 0,
              right = 1,
            },
          },
        },

        lualine_y = {},
        lualine_z = {},
      }

      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},

        lualine_c = {
          {
            "filename",
            path = 1,

            color = {
              fg = p.fujiGray,
              bg = bar_bg,
            },
          },
        },

        lualine_x = {
          {
            "location",

            color = {
              fg = p.fujiGray,
              bg = bar_bg,
            },
          },
        },

        lualine_y = {},
        lualine_z = {},
      }

      return opts
    end,
  },
}
