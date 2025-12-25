local parsers = {
	"blade",
	"php",
	"php_only",
	"regex",
	"sql",
	"lua",
	"html",
	"css",
	"json",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = {},
		config = function(_, opts)
			local nts = require("nvim-treesitter")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function()
					vim.treesitter.start()
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			nts.setup(opts)
			nts.install(parsers)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-moon]])
	-- 	end,
	-- },
	-- {
	-- 	"blazkowolf/gruber-darker.nvim",
	-- 	opts = {
	-- 		bold = false,
	-- 		italic = {
	-- 			strings = false,
	-- 		},
	-- 	},
	-- },
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = false,
					enable_rename = false,
					enable_close_on_slash = false,
				},

				per_filetype = {
					["blade"] = {
						enable_close = true,
						enable_rename = true,
					},
				},
			})
		end,
	},
}
