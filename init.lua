vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "UTF-8"
-- vim.opt.guifont = { "JetBrainsMono Nerd Font Bold", "h11" }
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- vim.opt.mouse = vim.cmd([[set sessionoptions-=blank]])
vim.cmd([[autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc  ]])
-- vim.cmd [[colorscheme tokyonight-night]]
-- vim.opt.clipboard+=unnamed
vim.cmd([[
let g:coc_start_at_startup=0
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
]])

require("plugins")
require("telescope-config")
require("bufferline-config")
require("treesitter-config")
require("web-devicons")
require("nvim-tree-config")
require("lsp")
require("autopair-config")
require("keybindings")
require("whichkey-config")
-- require("indent-config")
require("colorizer-config")
require("gitsigns-config")
require("null-ls-config")
require("nvim-comment-config")
require("tokyonight-config")
-- require("coc-config")
require("jabs-buffer-config")
-- require('gruvbox-config')
-- require('nightfox-config')
require("surround-config")
-- require('nord-config')
-- require('rose-pine-config')

-- require("solarized-config")
-- require("lualine-config")
require("feline-config")
require("nvim-dap-config")
require("dap-ui-config")
require("jdtls-config")
require("null-ls-mason-config")
