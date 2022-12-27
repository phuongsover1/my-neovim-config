vim.g.mapleader = ' '
local keymap = vim.api.nvim_set_keymap;
vim.cmd[[nnoremap q <c-v>]]
keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
keymap('i', 'jk', '<Esc>', { noremap = true, silent = false })
keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = false })
keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = false })
keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = false })
keymap('n', '<F3>', ':NvimTreeFindFile<CR>', { noremap = true, silent = false })
keymap('n', '<F4>', ':NvimTreeCollapse<CR>', { noremap = true, silent = false })

vim.cmd [[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

]]

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- JABS-Buffer
keymap("n", "<leader>,", "<cmd>JABSOpen<cr>", {silent = false, noremap=true})

keymap('n', '<C-d>', '<C-d>zz', {silent = false, noremap = true})
keymap('n', '<C-u>', '<C-u>zz', {silent = false, noremap = true})


local opts = { noremap=true, silent=true }
  keymap("n", "<leader>f", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)
