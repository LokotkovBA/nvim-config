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
--
-- local function patch(result)
--     if not vim.tbl_islist(result) or type(result) ~= "table" then
--         return result
--     end
--
--     return { result[1] }
-- end
--
-- local function handle_gtd(err, result, ctx, ...)
--     vim.lsp.handlers['textDocument/definition'](err, patch(result), ctx, ...)
-- end
--
-- lspconfig.tsserver.setup {
--     -- other options
--     handlers = {
--         ['textDocument/definition'] = handle_gtd
--     }
-- }
