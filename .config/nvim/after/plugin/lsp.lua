local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'eslint',
  'rust_analyzer',
  'jdtls',
  'ltex',
  'pyright',
  'clangd',
  'cmake',
  'cssls'
})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'copilot'},
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  }
})
