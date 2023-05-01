local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_leave_insert", { clear = false })

null_ls.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd("InsertLeave", {
            buffer = bufnr,
            group = group,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end,
})
