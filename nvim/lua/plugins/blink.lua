local vim = vim

return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",

		laravel = {
			name = "laravel",
			module = "blink.compat.source",
			score_offset = 95, -- show at a higher priority than lsp
		},

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
				use_nvim_cmp_as_default = true,
			},

			completion = {
				menu = {
					auto_show = true,
					border = "rounded",
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					window = { -- Add this for hover/doc windows
						border = "single", -- Border style
						max_width = 80,
						max_height = 20,
					},
				},

				trigger = {
					show_on_trigger_character = true,
					show_on_blocked_trigger_characters = { " ", "\n", "\t" },
				},
			},

			signature = {
				enabled = true,
				window = {
					show_documentation = true,
					border = "single",
				},
			},

			fuzzy = { implementation = "prefer_rust" },
		},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"intelephense",
				"html",
				"cssls",
				"eslint",
				"tailwindcss",
				"gopls",
				"ruby_lsp",
				"sorbet",
			},
			handlers = {}, -- Disable auto-setup to use new API
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},

		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("lspconfig")

			local servers = {
				"lua_ls",
				"intelephense",
				"html",
				"cssls",
				"eslint",
				"tailwindcss",
				"gopls",
				"ruby_lsp",
				"sorbet",
			}

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {})
			end

			vim.lsp.enable(servers)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					vim.keymap.set("n", "df", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Definition" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: References" })
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = bufnr, desc = "LSP: Code action" }
					)
				end,
			})

			vim.cmd([[
                autocmd BufEnter *.lua :setlocal tabstop=2 shiftwidth=2 expandtab
                autocmd BufEnter *.js :setlocal tabstop=2 shiftwidth=2 expandtab
                autocmd BufEnter *.jsx :setlocal tabstop=2 shiftwidth=2 expandtab
                autocmd BufEnter *.ts :setlocal tabstop=2 shiftwidth=2 expandtab
                autocmd BufEnter *.tsx :setlocal tabstop=2 shiftwidth=2 expandtab
                autocmd BufEnter *.blade.php :setlocal tabstop=4 shiftwidth=4 expandtab
            ]])
		end,
	},
}
