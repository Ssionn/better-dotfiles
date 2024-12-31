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
o.undofile = true
o.scrolloff = 4
o.sidescrolloff = 4

keymap.set('n', '<leader>w', ':bd<CR>', { noremap = true, silent = true })
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
keymap.set('v', 'y', 'myy`y')
keymap.set('v', '<leader>c', '"+y', { noremap = true, silent = true, desc = "Copy selection to system clipboard" });
keymap.set('n', ';;', '<Esc>A;<Esc>') -- Insert trailing semicolon
keymap.set('n', ',,', '<Esc>A,<Esc>') -- Insert trailing comma
keymap.set('n', '<leader>k', '<CMD>noh<CR>', { noremap = true, silent = true })

-- Cursorposition
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- Colorscheme
vim.cmd("colorscheme one-half-dark")
