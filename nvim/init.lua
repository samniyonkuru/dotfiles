package.path = "/nix/store/76i66j51z793dfinr1176i544mv0viz3-luajit-2.1.1785763465-env/share/lua/5.1/?.lua;/nix/store/76i66j51z793dfinr1176i544mv0viz3-luajit-2.1.1785763465-env/share/lua/5.1/?/init.lua".. ";" .. package.path
package.cpath = "/nix/store/76i66j51z793dfinr1176i544mv0viz3-luajit-2.1.1785763465-env/lib/lua/5.1/?.so".. ";" .. package.cpath

vim.g.loaded_node_provider=0;vim.g.loaded_perl_provider=0;vim.g.loaded_ruby_provider=0;vim.g.loaded_python3_provider=0
-- options
vim.o.number = true
vim.o.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.o.shiftwidth = 2
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

--config
require('config.keybinds')
require('config.plugins')

--lsp
require('lsp.lua')
require('lsp.haskell')
require('lsp.elm')
require('lsp.typescript')
require('lsp.python')

-- colors
vim.cmd("colorscheme gruvbox")

