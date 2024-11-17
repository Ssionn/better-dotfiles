return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                opts = {
                    relative = "editor",
                    position = {
                        row = "50%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = {
                            Normal = "KanagawaBackground",
                            FloatBorder = "KanagawaSubtle",
                            NormalFloat = "KanagawaBackground",
                            FloatTitle = "KanagawaSubtle",
                        },
                    },
                },
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
}
