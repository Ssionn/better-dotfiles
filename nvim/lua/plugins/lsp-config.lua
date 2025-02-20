return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"intelephense",
					"stimulus_ls",
					"tailwindcss",
					"html",
					"jsonls",
					"cssls",
					"ts_ls",
					"vuels",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { "/home/ssionn/.config/nvim/lua/phpDebug/phpDebug.js" },
			}

			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Listen for Xdebug",
					port = 9003,
				},
			}

			vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>bl", dap.set_breakpoint, {})
			vim.keymap.set("n", "<leader>bc", dap.continue, {})
			vim.keymap.set("n", "<leader>bd", dap.disconnect, {})
			vim.keymap.set("n", "<leader>bs", dap.step_over, {})
			vim.keymap.set("n", "<leader>bi", dap.step_into, {})
			vim.keymap.set("n", "<leader>bo", dap.step_out, {})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.intelephense.setup({ capabilities = capabilities })
			lspconfig.twiggy_language_server.setup({ capabilities = capabilities })
			lspconfig.stimulus_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					preferences = {
						tabSize = 2,
					},
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
				},
			})
			lspconfig.vuels.setup({ capabilities = capabilities })

			require("lspconfig.configs").pug_lsp = {
				default_config = {
					cmd = { "pug-lsp", "--stdio" },
					filetypes = { "pug" },
					root_dir = require("lspconfig.util").root_pattern("package.json"),
				},
			}

			vim.keymap.set("n", "df", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- {
	-- 	"Wansmer/symbol-usage.nvim",
	-- 	event = "LspAttach",
	-- 	config = function()
	-- 		require("symbol-usage").setup()
	-- 	end,
	-- },
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"L3MON4D3/LuaSnip",
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"windwp/nvim-autopairs",
	-- 		"onsails/lspkind.nvim",
	-- 	},
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local luasnip = require("luasnip")
	-- 		local lspkind = require("lspkind")
	--
	-- 		-- Set up nvim-autopairs
	-- 		local npairs = require("nvim-autopairs")
	-- 		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	--
	-- 		npairs.setup({
	-- 			check_ts = true,
	-- 			ts_config = {
	-- 				lua = { "string" },
	-- 				javascript = { "template_string" },
	-- 			},
	-- 			disable_filetype = { "TelescopePrompt" },
	-- 			fast_wrap = {
	-- 				map = "<M-e>",
	-- 				chars = { "{", "[", "(", '"', "'" },
	-- 				pattern = [=[[%'%"%>%]%)%}%,]]=],
	-- 				end_key = "$",
	-- 				keys = "qwertyuiopzxcvbnmasdfghjkl",
	-- 				check_comma = true,
	-- 				manual_position = true,
	-- 				highlight = "Search",
	-- 				highlight_grey = "Comment",
	-- 			},
	-- 		})
	--
	-- 		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	--
	-- 		local kind_icons = {
	-- 			Text = " 󰉿 ",
	-- 			Method = " 󰆧 ",
	-- 			Function = " 󰊕 ",
	-- 			Constructor = " ℭ ",
	-- 			Field = " 󰜢 ",
	-- 			Variable = " 󰀫 ",
	-- 			Class = " 󰠱 ",
	-- 			Interface = " ∭ ",
	-- 			Module = " ℳ",
	-- 			Property = " 󰜢 ",
	-- 			Unit = " 󰑭 ",
	-- 			Value = " 󰎠 ",
	-- 			Enum = " ➉ ",
	-- 			Keyword = " 󰌋 ",
	-- 			Snippet = " š ",
	-- 			Color = " 󰏘 ",
	-- 			File = " 󰈙 ",
	-- 			Reference = " 󰈇 ",
	-- 			Folder = " 󰉋 ",
	-- 			EnumMember = " # ",
	-- 			Constant = " 󰏿 ",
	-- 			Struct = " 󰙅 ",
	-- 			Event = " 󰃩 ",
	-- 			Operator = " 󰆕 ",
	-- 			TypeParameter = " ♳ ",
	-- 		}
	--
	-- 		cmp.setup({
	-- 			completion = {
	-- 				min_length = 1,
	-- 			},
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					luasnip.lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			window = {
	-- 				completion = cmp.config.window.bordered({
	-- 					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
	-- 					scrollbar = true,
	-- 				}),
	-- 				documentation = cmp.config.window.bordered({
	-- 					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
	-- 				}),
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				["<C-e>"] = cmp.mapping.abort(),
	-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
	-- 				["<Tab>"] = cmp.mapping.select_next_item(),
	-- 				["<S-Tab>"] = cmp.mapping.select_prev_item(),
	-- 			}),
	-- 			formatting = {
	-- 				fields = { "kind", "abbr", "menu" },
	-- 				format = function(entry, vim_item)
	-- 					vim_item.kind = kind_icons[vim_item.kind]
	--
	-- 					vim_item.menu = ({
	-- 						nvim_lsp = "[LSP]",
	-- 						luasnip = "[Snippet]",
	-- 						buffer = "[Buffer]",
	-- 						path = "[Path]",
	-- 					})[entry.source.name]
	--
	-- 					return vim_item
	-- 				end,
	-- 			},
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "luasnip" },
	-- 			}, {
	-- 				{ name = "buffer" },
	-- 			}),
	-- 			experimental = {
	-- 				ghost_text = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
