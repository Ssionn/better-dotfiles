local vim = vim
local o = vim.opt
local keymap = vim.keymap

-- Line settings
o.number = true
o.relativenumber = true
o.wrap = false
o.showmatch = true

-- Indent settings
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true

-- File settings
o.scrolloff = 4
o.sidescrolloff = 4

keymap.set("n", "<leader>w", ":bd<CR>", { noremap = true, silent = true })
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("v", "y", "myy`y")
keymap.set("v", "<leader>c", '"+y', { noremap = true, silent = true, desc = "Copy selection to system clipboard" })
keymap.set("n", ";;", "<Esc>A;<Esc>") -- Insert trailing semicolon
keymap.set("n", ",,", "<Esc>A,<Esc>") -- Insert trailing comma
keymap.set("n", "<leader>k", "<CMD>noh<CR>", { noremap = true, silent = true })
keymap.set("n", "<D-s>", ":w<CR>", { noremap = true, silent = true }) -- [Command + s] to save
keymap.set("v", "<D-c>", '"+y', { noremap = true, silent = true }) -- [Command + c] to copy

-- Cursorposition
vim.opt.updatetime = 300
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- Colorscheme
vim.cmd("colorscheme gruber-darker")

-- Filetype Indentation Settings
vim.cmd([[
  autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType typescript.tsx setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]])
