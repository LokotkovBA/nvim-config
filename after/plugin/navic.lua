local navic = require("nvim-navic")

navic.setup({
    lsp = {
        auto_attach = true,
        preference = { "volar", "ts_ls" }
    }
})
