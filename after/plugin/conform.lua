require("conform").setup({
    formatters_by_ft = {
        cs = { "csharpier" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
