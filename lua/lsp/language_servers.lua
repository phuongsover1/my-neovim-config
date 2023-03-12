-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require 'lspconfig'.angularls.setup { capabilities = capabilities }
require 'lspconfig'.jsonls.setup { capabilities = capabilities }
require 'lspconfig'.html.setup { capabilities = capabilities }

require 'lspconfig'.cssls.setup { capabilities = capabilities }
require 'lspconfig'.tsserver.setup { capabilities = capabilities }
require 'lspconfig'.eslint.setup { capabilities = capabilities }
require 'lspconfig'.lua_ls.setup { capabilities = capabilities }
require 'lspconfig'.jsonls.setup { capabilities = capabilities }
require 'lspconfig'.jedi_language_server.setup { capabilities = capabilities }
-- require 'lspconfig'.quick_lint_js.setup { capabilities = capabilities }

--   require'lspconfig'.sumneko_lua.setup {
--     capabilities = capabilities,
--     settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--         checkThirdParty = false,
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["bem.enabled"] = true
      }
    }
  }
})
