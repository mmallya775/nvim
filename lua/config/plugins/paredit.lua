vim.pack.add({
  'https://github.com/julienvincent/nvim-paredit',
})

require('nvim-paredit').setup({
  filetypes = { 'clojure' },
  keys = {
    ['<M-Right>']   = { require('nvim-paredit').api.slurp_forwards,           'Slurp forward'  },
    ['<M-Left>']    = { require('nvim-paredit').api.barf_forwards,            'Barf forward'   },
    ['<M-C-Left>']  = { require('nvim-paredit').api.slurp_backwards,         'Slurp backward' },
    ['<M-C-Right>'] = { require('nvim-paredit').api.barf_backwards,          'Barf backward'  },
    ['<M-Up>']      = { require('nvim-paredit').api.drag_element_backwards,  'Drag up'        },
    ['<M-Down>']    = { require('nvim-paredit').api.drag_element_forwards,   'Drag down'      },
    ['<M-s>']       = { require('nvim-paredit').api.unwrap_form_under_cursor,'Splice sexp'    },
    ['<M-r>']       = { require('nvim-paredit').api.raise_form,              'Raise form'     },
    ['<M-e>']       = { require('nvim-paredit').api.raise_element,           'Raise element'  },
  },
})
