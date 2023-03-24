vim.opt.termguicolors = true
vim.opt.number = true

vim.opt.relativenumber = true
vim.opt.encoding = "UTF-8"
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = vim.cmd([[set sessionoptions-=blank]])
vim.cmd([[autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc  ]])
vim.cmd([[
let g:sneak#label = 1
  map f <Plug>Sneak_s
  map F <Plug>Sneak_S
  set clipboard=unnamedplus
]])

require("plugins")
require("telescope-config")
require("treesitter-config")
require("web-devicons")
require("nvim-tree-config")
require("lsp")
require("autopair-config")
require("keybindings")
require("whichkey-config")
require("colorizer-config")
require("gitsigns-config")
require("null-ls-config")
require("nvim-comment-config")
-- require("tokyonight-config")
require("jabs-buffer-config")
require("surround-config")
-- require("feline-config")
require("nvim-dap-config")
require("dap-ui-config")
require("null-ls-mason-config")
require("fidget-config")
require("neoscroll-config")
-- require("rose-pine-config")
require("lualine-config")
require("indent-config")
require("catppuccin-config")
require("bufferline-config")
