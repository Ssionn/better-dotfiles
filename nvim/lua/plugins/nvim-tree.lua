return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			override = {
				lua = {
					icon = "",
					color = "#000080",
					name = "Lua",
				},
			},
		},
	},
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	version = "*",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	opts = {
	-- 		auto_reload_on_write = true,
	-- 		view = {
	-- 			adaptive_size = true,
	-- 			side = "left",
	-- 		},
	-- 		git = {
	-- 			enable = true,
	-- 		},
	-- 		filesystem_watchers = {
	-- 			enable = true,
	-- 			debounce_delay = 20,
	-- 			ignore_dirs = {
	-- 				"node_modules",
	-- 				"vendor",
	-- 			},
	-- 		},
	-- 		renderer = {
	-- 			icons = {
	-- 				glyphs = {
	-- 					folder = {
	-- 						arrow_closed = "→",
	-- 						arrow_open = "↓",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open Nvim Tree" },
	-- 		{ "<leader>co", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse Nvim Tree" },
	-- 		{ "<leader>r", "<cmd>NvimTreeFocus<cr>", desc = "Focus on Nvim Tree" },
	-- 	},
	-- },
}
