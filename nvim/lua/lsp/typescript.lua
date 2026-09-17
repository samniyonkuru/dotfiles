vim.lsp.config['tsls'] = {
  cmd = { 'typescript-language-server', '--stdio'},
  filetypes = { 'typescript' },
  root_markers = { 'tsconfig.json', 'package.json', '.git'}
}

vim.lsp.enable('tsls')
