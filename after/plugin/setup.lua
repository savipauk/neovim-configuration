local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)


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
    ['<Tab>'] = cmp.mapping.confirm({ select = false }),
  }),
})





local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)



local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
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
  ensure_installed = { 'lua_ls' },
  handlers = {
    lsp_zero.default_setup,
  },
})


require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "javascript", "json", "typescript", "go", "lua", "vim", "vimdoc", "query" },

  autotag = {
    enable = true,
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- require("claude-code").setup({})
