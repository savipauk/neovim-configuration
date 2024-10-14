require('savipauk')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set('n', '<F5>', ':lua CompileAndRun()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F5>', ':lua CompileAndRun()<CR>')
vim.keymap.set('n', '<leader>/', ':nohl <CR>')

vim.keymap.set("v", "J", ":m '> +1 <CR>gv=gv")
vim.keymap.set("v", "K", ":m '< -2 <CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")


-- vim.keymap.set('n', '<C-.>', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>')

require("luasnip.loaders.from_vscode").lazy_load()
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')


-- require('snippy').setup({
--     mappings = {
--         is = {
--             ['<Tab>'] = 'expand_or_advance',
--             ['<S-Tab>'] = 'previous',
--         },
--         nx = {
--             ['<leader>x'] = 'cut_text',
--         },
--     }
-- })
-- snippets
-- vim.kymap.set('i', '<Tab>',
--     ':lua.snippy_can_expand_or_advance() and "<Plug>(snippy-expand-or-advance)" or "<Tab>"',
--     { expr = true, noremap = true, silent = true })
-- vim.keymap.set('i', '<S-Tab>', ':lua.snippy_can_jump(-1) and "<Plug>(snippy-previous)" or "<S-Tab>"',
--     { expr = true, noremap = true, silent = true })
-- vim.keymap.set('s', '<Tab>', ':lua.snippy_can_jump(1) and "<Plug>(snippy-next)" or "<Tab>"',
--     { expr = true, noremap = true, silent = true })
-- vim.keymap.set('s', '<S-Tab>', ':lua.snippy_can_jump(-1) and "<Plug>(snippy-previous)" or "<S-Tab>"',
--     { expr = true, noremap = true, silent = true })
-- vim.keymap.set('x', '<Tab>', '<Plug>(snippy-cut-text)', { noremap = true, silent = true })


-- need to setup tmux and silent
-- https://youtu.be/w7i4amO_zaE?t=1712
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


function Format()
  vim.lsp.buf.format({})
  vim.cmd('normal! gg=G')
end

vim.keymap.set("n", "<leader>f", Format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
