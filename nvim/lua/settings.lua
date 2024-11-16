local vim = vim
local global = vim.g
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

-- Additional Keybinds
keymap.set("n", "df", "<CMD>call CocActionAsync('doHover')<CR>", {
    silent = true,
    noremap = true,
    desc = "Show hover documentation"
})

keymap.set('i', '<TAB>', function()
    if vim.fn['coc#pum#visible']() == 1 then
        return vim.fn['coc#pum#next'](1)
    elseif vim.fn['coc#expandableOrJumpable']() == 1 then
        return vim.fn['coc#rpc#request']('doKeymap', { 'snippets-expand-jump', '' })
    else
        return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
    end
end, {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
})

keymap.set('i', '<S-TAB>', function()
    if vim.fn['coc#pum#visible']() == 1 then
        return vim.fn['coc#pum#prev'](1)
    else
        return '<C-h>'
    end
end, {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
})

keymap.set('i', '<CR>', function()
    if vim.fn['coc#pum#visible']() == 1 then
        return vim.fn['coc#pum#confirm']()
    else
        return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
    end
end, {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = true
})

keymap.set('n', '<leader>w', ':bd<CR>', { noremap = true, silent = true })
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
keymap.set('v', 'y', 'myy`y')
keymap.set('i', ';;', '<Esc>A;<Esc>') -- Insert trailing semicolon
keymap.set('i', ',,', '<Esc>A,<Esc>') -- Insert trailing comma
keymap.set('n', '<leader>k', '<CMD>noh<CR>', { noremap = true, silent = true })

-- Colorscheme
vim.cmd("colorscheme kanagawa-wave")
