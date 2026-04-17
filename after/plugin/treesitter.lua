require("nvim-treesitter-textobjects").setup({
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
        },
    },
})

local parsers = {
    "gitcommit",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "typescript",
    "jsx",
    "tsx",
    "scss",
    "gitignore",
    "json"
}

require('nvim-treesitter').install(parsers)
vim.api.nvim_create_autocmd('FileType', {
    pattern = parsers,
    callback = function() vim.treesitter.start() end,
})
