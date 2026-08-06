require("monokai-pro").setup({
  filter = "classic",
})
vim.cmd.colorscheme("monokai-pro-classic")
vim.api.nvim_set_hl(0, "@type.definition", { link = "@type" })
