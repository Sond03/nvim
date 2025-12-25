vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false

local undodir = vim.fn.stdpath("data") .. "/undo"
vim.o.undodir = undodir
vim.o.undofile = true
vim.fn.mkdir(undodir, "p")

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8

vim.o.updatetime = 50

vim.g.mapleader = " "
vim.o.cursorline = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  float = {
    border = "rounded",
    source = "always", -- shows where the error comes from
  },
})

