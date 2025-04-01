local cmp = require('cmp')

cmp.setup({
  enabled = true,
  preselect = cmp.PreselectMode.None,
  sources = {
    { name = 'nvim_lsp' }
  },
  completion = {
    autocomplete = false
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
  }),
})
