vim.lsp.config['hls'] = {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell' },
  root_markers = { '*.cabal' },
}

vim.lsp.enable('hls')
