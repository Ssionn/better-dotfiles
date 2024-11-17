return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                mode = "buffers",         -- tabs or buffers
                separator_style = "thin", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
                show_buffer_close_icons = true,
                show_close_icon = false,
                color_icons = true,
                always_show_bufferline = true,
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    }
                },
            },
            highlights = {
                buffer_selected = {
                    fg = "#DCD7BA",
                    bg = "#1F1F28",
                    bold = true,
                    italic = true,
                },
                separator = {
                    fg = "#16161D",
                    bg = "#2A2A37",
                },
                separator_selected = {
                    fg = "#16161D",
                    bg = "#1F1F28",
                },
                background = {
                    fg = "#727169",
                    bg = "#2A2A37",
                },
                close_button = {
                    fg = "#727169",
                    bg = "#2A2A37",
                },
                close_button_selected = {
                    fg = "#DCD7BA",
                    bg = "#1F1F28",
                },
                diagnostic = {
                    fg = "#727169",
                    bg = "#2A2A37",
                },
                diagnostic_selected = {
                    fg = "#DCD7BA",
                    bg = "#1F1F28",
                    bold = true,
                    italic = true,
                },
                hint = {
                    fg = "#658594",
                    bg = "#2A2A37",
                },
                hint_selected = {
                    fg = "#658594",
                    bg = "#1F1F28",
                    bold = true,
                    italic = true,
                },
                warning = {
                    fg = "#FFA066",
                    bg = "#2A2A37",
                },
                warning_selected = {
                    fg = "#FFA066",
                    bg = "#1F1F28",
                    bold = true,
                    italic = true,
                },
                error = {
                    fg = "#FF5D62",
                    bg = "#2A2A37",
                },
                error_selected = {
                    fg = "#FF5D62",
                    bg = "#1F1F28",
                    bold = true,
                    italic = true,
                },
                modified = {
                    fg = "#7AA89F",
                    bg = "#2A2A37",
                },
                modified_selected = {
                    fg = "#7AA89F",
                    bg = "#1F1F28",
                },
            },
        }
    },
}
