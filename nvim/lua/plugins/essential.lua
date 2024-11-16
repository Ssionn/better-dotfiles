return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                prompt_prefix = "🔍 ",
                selection_caret = "❯ ",
                path_display = { "truncate" },
                preview = false,

                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                    },
                    width = 0.6,
                    height = 0.6,
                },
            }
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },
        },
    },

    -- Colorscheme
    {
        "rebelot/kanagawa.nvim",
    },

    -- File navigation tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            auto_reload_on_write = true,
            view = {
                adaptive_size = true,
                side = "right",
            },
            git = {
                enable = true,
            },
            filesystem_watchers = {
                enable = true,
                debounce_delay = 50,
                ignore_dirs = {
                    "node_modules",
                    "vendor"
                },
            },
        },
        keys = {
            { "<leader>e",  "<cmd>NvimTreeToggle<cr>",   desc = "Open Nvim Tree" },
            { "<leader>co", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse Nvim Tree" },
            { "<leader>r",  "<cmd>NvimTreeFocus<cr>",    desc = "Focus on Nvim Tree" },
        },
    },

    -- LSP Configuration
    {
        "neoclide/coc.nvim",
        lazy = false,
        keys = {
            { "gd", "<Plug>(coc-definition)",      desc = "Open definition" },
            { "gy", "<Plug>(coc-type-definition)", desc = "Open type definition" },
            { "gi", "<Plug>(coc-implementation)",  desc = "Open implementation" },
            { "gr", "<Plug>(coc-references)",      desc = "Open references" },
        },
    },

    -- Commenting
    {
        'numToStr/Comment.nvim',
    },

    -- Indentation visualization
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },

    -- Formatter by language
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                php = { "php-cs-fixer" },
                lua = { 'stylua' },
            }
        },
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'auto',
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic', 'coc' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                    }
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        symbols = {
                            modified = ' ●',
                            readonly = ' ',
                            unnamed = '[No Name]',
                        }
                    },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
        },
    },

    -- Better command prompt
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

    -- Bufferline
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
                diagnostics = "nvim_lsp", -- | "coc",
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

    -- Treesitter for syntax
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = { enable = true },
            ensure_installed = {
                'html',
                'blade',
                'css',
                'php',
                'typescript',
                'javascript',
                'markdown',
                'yaml',
                'json',
                'lua',
            }
        }
    }
}
