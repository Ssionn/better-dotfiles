vim.keymap.set("n", "<leader>l", function()
	vim.diagnostic.setloclist({ open = true })
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>w", function()
	-- Get current buffer number
	local current_buf = vim.api.nvim_get_current_buf()

	local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
	if #listed_buffers == 1 and listed_buffers[1].bufnr == current_buf then
		vim.notify(
			"Last listed buffer (sidebar like Neo-tree is unlisted)—skipping delete to avoid quitting Neovim",
			vim.log.levels.WARN
		)
		return
	end

	local ok, err = pcall(vim.cmd.bdelete)
	if not ok then
		vim.notify("Failed to delete buffer: " .. (err or "Unknown error"), vim.log.levels.ERROR)
		return
	end

	if #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
		vim.cmd("e " .. vim.fn.bufname(current_buf)) -- Reopen the file you just deleted
		vim.notify("No listed buffers after delete—reopened the file", vim.log.levels.INFO)
	end
end, { noremap = true, silent = true, desc = "Delete buffer (safe with sidebar)" })

vim.keymap.set("v", "<leader>c", '"+y', { noremap = true, silent = true }) -- Copy to clipboard (currently broken)
