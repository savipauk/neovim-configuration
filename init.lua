local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

require("lazy").setup("savipauk.plugins")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local function compile_and_run()
  local path = vim.fn.expand("%:p")
  local dir = vim.fn.fnamemodify(path, ":h")
  local extension = vim.fn.fnamemodify(path, ":e")
  local filename = vim.fn.fnamemodify(path, ":t")
  local name = vim.fn.fnamemodify(path, ":t:r")
  local cd = "cd " .. vim.fn.shellescape(dir) .. " && "

  if extension == "cpp" or extension == "cc" or extension == "c" then
    local output = "out_" .. name .. ".out"
    local compile = "g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -pthread -o "
      .. vim.fn.shellescape(output) .. " " .. vim.fn.shellescape(filename)
    vim.cmd("term " .. cd .. compile .. " && ./" .. vim.fn.shellescape(output))
  elseif extension == "py" then
    vim.cmd("term " .. cd .. "python3 " .. vim.fn.shellescape(filename))
  elseif extension == "go" then
    vim.cmd("term " .. cd .. "go mod tidy && go run .")
  elseif extension == "cs" then
    vim.cmd("term " .. cd .. "dotnet run")
  else
    print("not a valid file")
  end
end

vim.keymap.set("n", "<F5>", compile_and_run)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "J", ":m '> +1 <CR>gv=gv")
vim.keymap.set("v", "K", ":m '< -2 <CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")

vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)

local luasnip_ok, luasnip = pcall(require, "luasnip")
if luasnip_ok then
  require("luasnip.loaders.from_vscode").lazy_load()
  vim.keymap.set({ "i" }, "<C-K>", function() luasnip.expand() end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end, { silent = true })
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end
})

local function format()
  vim.lsp.buf.format({})
end

vim.keymap.set("n", "<leader>f", format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
