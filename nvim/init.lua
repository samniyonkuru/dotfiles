-- Options
vim.o.number = true
vim.o.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.o.shiftwidth = 2

vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

  -- Status bar
  {
    "nvim-lualine/lualine.nvim",
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
  },

  -- Tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
  },

})

-- Config
require("config.keybinds")
require("config.plugins")

-- LSP
require("lsp.lua")
require("lsp.haskell")
require("lsp.elm")
require("lsp.typescript")
require("lsp.python")

-- Colors
vim.cmd("colorscheme gruvbox")
