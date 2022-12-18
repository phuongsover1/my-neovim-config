vim.g.mapleader=' '
local map = vim.api.nvim_set_keymap;
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

map('i', 'jk', '<Esc>', {noremap = true, silent = false})

map('n', '<C-s>', ':w<CR>', {noremap = true, silent = false})
map('i', '<C-s>', '<Esc>:w<CR>', {noremap = true, silent = false})

map('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true, silent = false})
map('n', '<F3>', ':NvimTreeFindFile<CR>', {noremap = true, silent = false})
map('n', '<F4>', ':NvimTreeCollapse<CR>', {noremap = true, silent = false})

vim.cmd[[
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


