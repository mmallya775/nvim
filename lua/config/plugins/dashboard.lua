vim.pack.add({
  'https://github.com/nvimdev/dashboard-nvim',
})

require('dashboard').setup({
  theme         = 'hyper',
  shortcut_type = 'letter',
  shuffle_letter = false,
  change_to_vcs_root = true,
  hide = {
    statusline = true,
    tabline    = true,
    winbar     = true,
  },
  config = {
     header = {
  '',
  '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
  '',
  '',
  '',
  },
    shortcut = {
      {
        desc   = '› Find File',
        key    = 'f',
        action = 'Telescope find_files',
      },
      {
        desc   = '» Live Grep',
        key    = 'g',
        action = 'Telescope live_grep',
      },
      {
        desc   = '» Recent Files',
        key    = 'r',
        action = 'Telescope oldfiles',
      },
      {
        desc   = '+ New File',
        key    = 'n',
        action = 'enew',
      },
      {
        desc   = '⚙ Config',
        key    = 'c',
        action = 'edit ~/.config/nvim/init.lua',
      },
      {
        desc   = '✘ Quit',
        key    = 'q',
        action = 'qa',
      },
    },
    packages = { enable = false },  -- hide plugin count
    project  = { enable = true, limit = 5 },
    mru      = { enable = true, limit = 5 },
    footer   = {
      '',
      '  The editor that never crashes  ·  probably',
    },
  },
})
