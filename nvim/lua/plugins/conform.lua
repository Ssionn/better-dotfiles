return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				php = { "php_cs_fixer" },
				blade = { "blade-formatter" },
				css = { "stylelint" },
				html = { "superhtml" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "yamlfmt" },
				markdown = { "markdownlint" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		},
	},
}
