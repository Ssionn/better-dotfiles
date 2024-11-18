return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                php = { "php-cs-fixer" },
                lua = { "stylua" },
                blade = { "blade-formatter" },
                javascript = { "deno_fmt" },
                typescript = { "deno_fmt" },
                html = { "superhtml" },
                css = { "stylelint" },
                json = { "deno_fmt" },
                jsonc = { "deno_fmt" },
                yaml = { "yamlfmt" },
                markdown = { "deno_fmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
