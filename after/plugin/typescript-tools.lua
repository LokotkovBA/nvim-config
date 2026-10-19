local ts_tools = require("typescript-tools")

ts_tools.setup({
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<cr>", opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.definition() end, opts)
    end,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', },

})
