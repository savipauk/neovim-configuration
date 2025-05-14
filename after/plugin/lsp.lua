local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions


  lsp_zero.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require("lspconfig")
lspconfig.cssls.setup({
  settings = {
    css = { validate = false },
    scss = { validate = false },
    less = { validate = false }
  }
})

lspconfig.tailwindcss.setup({
  init_options = {
    userLanguages = {
      html = "html",
      css = "css",
      javascript = "javascript",
      typescript = "typescript",
      javascriptreact = "javascriptreact",
      typescriptreact = "typescriptreact",
      svelte = "html",
      vue = "html",
      astro = "html",
    }
  },
  filetypes = {
    "html", "css", "javascript", "typescript",
    "javascriptreact", "typescriptreact", "svelte", "vue", "astro"
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)",            -- tw`...`
          "class:\\s*\"([^\"]*)",  -- class: "..." (Svelte)
          "className=([^ ]*)",     -- React className
          "class=\\s*\"([^\"]*)\"" -- HTML class
        }
      }
    }
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'lua_ls' },
  handlers = {
    lsp_zero.default_setup,
  },
})
