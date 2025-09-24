return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	keys = {
		{
			"<leader>e",
			"<cmd>Neotree toggle<cr>",
			desc = "Toggle file tree",
		},
		{
			"<leader>r",
			"<cmd>Neotree focus<cr>",
			desc = "Focus file tree",
		},
	},

	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		close_if_last_window = true,
		default_component_configs = {
			icon = {
				folder_closed = "+",
				folder_open = "-",
				folder_empty = "%",
				default = "",
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			components = {
				icon = function(config, node, state)
					if node.type == "file" then
						return {}
					end
					return require("neo-tree.sources.common.components").icon(config, node, state)
				end,
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true,
			},
		},
	},
}
