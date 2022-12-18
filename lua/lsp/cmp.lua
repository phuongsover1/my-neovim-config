vim.g.completeopt = "menu,menuone,noselect,noinsert"

 -- Set up nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')


  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
      --  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
     -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip', option = { use_show_condition = true }}, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      --{ name = 'buffer' },
    }),
    formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  }
  })
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("luasnip.loaders.from_vscode").lazy_load()


--vim.g.completeopt = "menu,menuone,noselect,noinsert"
--local has_words_before = function()
--  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--  return col ~= 0
--             and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
--             == nil
--end
--
--local feedkey = function(key, mode)
--  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
--end
---- Setup nvim-cmp.
--local cmp = require 'cmp'
--local lspkind = require('lspkind')
--
--cmp.setup({
-- -- preselect = cmp.PreselectMode.None,
--  snippet = {
--    expand = function(args)
--      -- For `vsnip` user.
--      vim.fn["vsnip#anonymous"](args.body)
--
--      -- For `luasnip` user.
--      -- require('luasnip').lsp_expand(args.body)
--
--      -- For `ultisnips` user.
--      -- vim.fn["UltiSnips#Anon"](args.body)
--    end
--  },
--  mapping = {
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-e>'] = cmp.mapping.close(),
--    ['<CR>'] = cmp.mapping.confirm({select = true}),
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif vim.fn["vsnip#available"]() == 1 then
--        feedkey("<Plug>(vsnip-expand-or-jump)", "")
--      elseif has_words_before() then
--        cmp.complete()
--      else
--        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
--      end
--    end, {"i", "s"}),
--
--    ["<S-Tab>"] = cmp.mapping(function()
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
--        feedkey("<Plug>(vsnip-jump-prev)", "")
--      end
--    end, {"i", "s"})
--  },
--  sources = {
--    {name = 'nvim_lsp'}, -- For vsnip user.
--    {name = 'vsnip'}, -- For luasnip user.
--    -- { name = 'luasnip' },
--    -- For ultisnips user.
--    -- { name = 'ultisnips' },
--    {name = 'buffer'}
--  },
--  formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})}
--})
--


