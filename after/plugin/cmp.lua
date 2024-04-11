local cmp = require('cmp')

cmp.setup({
    enabled = true,
    preselect = cmp.PreselectMode.None,
    sources = {
        {name = 'nvim_lsp'}
    }
})
