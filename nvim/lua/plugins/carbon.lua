return {
    {
        "SidOfc/carbon.nvim",
        config = function()
            require("carbon").setup({})

            vim.keymap.set("n", "<leader>e", "<cmd>Carbon<cr>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>h", function()
                require("carbon").toggle_hidden()
            end, { noremap = true, silent = true })
        end,
    },
}
