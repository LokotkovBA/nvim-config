local prettier = require("prettier");

prettier.setup({
    bin = "prettierd",
    filetypes = {
        "html",
        "css",
        "scss",
        "less",
        "javascript",
        "javascriptreact",
        "json",
        "typescript",
        "typescriptreact",
        "markdown",
    }
})
