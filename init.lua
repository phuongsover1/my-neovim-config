vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"
vim.opt.guifont = { "VictorMono Nerd Font", "h12" }
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.cmd [[set sessionoptions-=blank]]
vim.cmd [[colorscheme tokyonight-night]]
--vim.opt.clipboard+=unnamed

require('plugins')
require('treesitter-config')
require('telescope-config')
require('lualine-config')
require('bufferline-config')
require('web-devicons')
require('nvim-tree-config')
require('lsp')
require('autopair-config')
require('keybindings')
require('whichkey-config')
require('indent-config')
require('colorizer-config')
require('gitsigns-config')
require('null-ls-config')
require('dashboard-config')
require('nvim-comment-config')
