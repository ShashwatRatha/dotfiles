vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.opts")     
require("core.keymaps")   
require("core.loader")

vim.cmd.colorscheme "oxocarbon"
