vim.pack.add({
  'https://github.com/windwp/nvim-autopairs',
})

require('nvim-autopairs').setup({
  check_ts         = true,
  ts_config        = {
    clojure = { 'string', 'comment' },
  },
  disable_filetype = { 'TelescopePrompt' },
  fast_wrap        = {
    map     = '<M-e>',
    chars   = { '{', '[', '(', '"' },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    keys    = 'qwertyuiopzxcvbnmasdfghjkl',
  },
})
