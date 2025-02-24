local vim = vim
local o = vim.opt
local keymap = vim.keymap
local opts = { noremap = true, silent = true, }

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

keymap.set("n", "<leader>w", ":bd<CR>", opts)
keymap.set("v", "<", "<gv")              -- Add indentation to the left
keymap.set("v", ">", ">gv")              -- Add indentation to the right
keymap.set("v", "y", "myy`y")            -- Copy to nvim clipboard (not system)
keymap.set("v", "<leader>c", '"+y', opts)
keymap.set("n", ";;", "<Esc>A;<Esc>")    -- Insert trailing semicolon
keymap.set("n", ",,", "<Esc>A,<Esc>")    -- Insert trailing comma
keymap.set("n", "<leader>k", "<CMD>noh<CR>", opts)
keymap.set("n", "<D-s>", ":w<CR>", opts) -- [Command + s] to save
keymap.set("v", "<D-c>", '"+y', opts)    -- [Command + c] to copy

keymap.set('n', '<leader>vs', ":vsplit<Return>", opts)
keymap.set('n', '[', "<C-w>h", opts)
keymap.set('n', ']', "<C-w>l", opts)
keymap.set('n', '<C-[>', "<C-w>l<C-w>o", opts)
keymap.set('n', '<C-]>', "<C-w>h<C-w>o", opts)

-- Cursorposition
vim.o.updatetime = 300
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- Colorscheme
vim.o.background = "dark"
vim.cmd("colorscheme oxocarbon")

-- Filetype Indentation Settings
vim.cmd([[
  autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType typescript.tsx setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]])
