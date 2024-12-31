return {
    {
        'vim-test/vim-test',
        dependencies = {
            'preservim/vimux'
        },
        config = function()
            vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit'

            vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
        end
    }
}
