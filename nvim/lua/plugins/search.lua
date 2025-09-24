return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		-- Root finder for project boundaries
		local function find_project_root()
			local root = vim.fs.root(0, {
				".git",
				"composer.json",
				"package.json",
				".env",
			})
			return root and vim.fn.fnamemodify(root, ":p:h") or vim.fn.getcwd()
		end

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					"vendor",
					"%.DS_Store",
					"Thumbs.db",
				},
				preview = {
					treesitter = false,
				},
			},
		})

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ cwd = find_project_root() })
		end, vim.tbl_extend("force", opts, { desc = "Telescope find files" }))

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ cwd = find_project_root() })
		end, vim.tbl_extend("force", opts, { desc = "Telescope live grep" }))

		vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
	end,
}
