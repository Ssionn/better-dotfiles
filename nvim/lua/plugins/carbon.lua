return {
	{
		"SidOfc/carbon.nvim",
		config = function()
			require("carbon").setup({})

			vim.keymap.set("n", "<leader>e", "<cmd>Carbon<cr>", { noremap = true, silent = true })
		end,
	},
}
