return {
    --     {
    --         'akinsho/bufferline.nvim',
    --         version = "*",
    --         dependencies = 'nvim-tree/nvim-web-devicons',
    --         opts = {
    --             options = {
    --                 mode = "buffers",         -- tabs or buffers
    --                 separator_style = "thin", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
    --                 show_buffer_close_icons = true,
    --                 show_close_icon = false,
    --                 color_icons = true,
    --                 always_show_bufferline = true,
    --                 diagnostics_indicator = function(count, level)
    --                     local icon = level:match("error") and " " or " "
    --                     return " " .. icon .. count
    --                 end,
    --                 offsets = {
    --                     {
    --                         filetype = "NvimTree",
    --                         text = "File Explorer",
    --                         highlight = "Directory",
    --                         separator = true,
    --                     }
    --                 },
    --             },
    --             highlights = {
    --                 buffer_selected = {
    --                     fg = "#4C4F69", -- Text
    --                     bg = "#EFF1F5", -- Base
    --                     bold = true,
    --                     italic = true,
    --                 },
    --                 separator = {
    --                     fg = "#DCE0E8", -- Crust
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 separator_selected = {
    --                     fg = "#DCE0E8", -- Crust
    --                     bg = "#EFF1F5", -- Base
    --                 },
    --                 background = {
    --                     fg = "#9CA0B0", -- Subtext0
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 close_button = {
    --                     fg = "#9CA0B0", -- Subtext0
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 close_button_selected = {
    --                     fg = "#4C4F69", -- Text
    --                     bg = "#EFF1F5", -- Base
    --                 },
    --                 diagnostic = {
    --                     fg = "#9CA0B0", -- Subtext0
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 diagnostic_selected = {
    --                     fg = "#4C4F69", -- Text
    --                     bg = "#EFF1F5", -- Base
    --                     bold = true,
    --                     italic = true,
    --                 },
    --                 hint = {
    --                     fg = "#209FB5", -- Sapphire
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 hint_selected = {
    --                     fg = "#209FB5", -- Sapphire
    --                     bg = "#EFF1F5", -- Base
    --                     bold = true,
    --                     italic = true,
    --                 },
    --                 warning = {
    --                     fg = "#FE640B", -- Peach
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 warning_selected = {
    --                     fg = "#FE640B", -- Peach
    --                     bg = "#EFF1F5", -- Base
    --                     bold = true,
    --                     italic = true,
    --                 },
    --                 error = {
    --                     fg = "#D20F39", -- Red
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 error_selected = {
    --                     fg = "#D20F39", -- Red
    --                     bg = "#EFF1F5", -- Base
    --                     bold = true,
    --                     italic = true,
    --                 },
    --                 modified = {
    --                     fg = "#40A02B", -- Green
    --                     bg = "#CCD0DA", -- Surface1
    --                 },
    --                 modified_selected = {
    --                     fg = "#40A02B", -- Green
    --                     bg = "#EFF1F5", -- Base
    --                 },
    --             }
    --         }
    --     },
}
