return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			php = { "php_cs_fixer" },
			blade = { "blade-formatter" },
			css = { "prettier" },
			html = { "htmlbeautifier" },
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			ruby = { "rubocop" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 4000,
		},
	},
}
