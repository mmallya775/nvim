vim.lsp.config['clojure_lsp'] = {
  cmd          = { 'clojure-lsp' },
  filetypes    = { 'clojure' },
  root_markers = { 'deps.edn', 'project.clj', 'build.boot', 'shadow-cljs.edn', '.git' },
  settings     = {
    clojure = {
      diagnostics = { enabled = true },
    },
  },
}

vim.lsp.enable('clojure_lsp')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local map = function(k, f, desc)
      vim.keymap.set('n', k, f, { buffer = ev.buf, desc = desc })
    end

    map('K',          vim.lsp.buf.hover,         'Hover docs')
    map('gd',         vim.lsp.buf.definition,    'Go to definition')
    map('gD',         vim.lsp.buf.declaration,   'Go to declaration')
    map('gi',         vim.lsp.buf.implementation,'Go to implementation')
    map('gr',         vim.lsp.buf.references,    'References')
    map('<leader>rn', vim.lsp.buf.rename,        'Rename')
    map('<leader>ca', vim.lsp.buf.code_action,   'Code action')
    map('<leader>fm', vim.lsp.buf.format,        'Format file')
  end,
})
