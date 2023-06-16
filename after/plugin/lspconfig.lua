local lspconfig = require('lspconfig')

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

local on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
end

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        }
    }
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer"
    },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
})
