local vim = vim
local o = vim.opt

-- Enable persistent undo history
o.undofile = true

-- Session options
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Create session directory if it doesn't exist
local session_dir = vim.fn.stdpath("data") .. "/sessions/"
vim.fn.mkdir(session_dir, "p")

-- Function to get the session file path
local function get_session_file()
    local dir = vim.fn.getcwd()
    local session_file = session_dir .. vim.fn.substitute(dir, "/", "_", "g") .. ".vim"
    return session_file
end

-- Auto save session when exiting Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if #vim.fn.getbufinfo({ buflisted = 1 }) > 0 then
            vim.cmd("mksession! " .. get_session_file())
        end
    end,
})

-- Auto load session when starting Neovim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            local session_file = get_session_file()
            if vim.fn.filereadable(session_file) == 1 then
                vim.cmd("source " .. session_file)
            end
        end
    end,
})

-- Commands to manually save/load sessions
vim.api.nvim_create_user_command("SaveSession", function()
    vim.cmd("mksession! " .. get_session_file())
    print("Session saved!")
end, {})

vim.api.nvim_create_user_command("LoadSession", function()
    local session_file = get_session_file()
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd("source " .. session_file)
        print("Session loaded!")
    else
        print("No session found!")
    end
end, {})
