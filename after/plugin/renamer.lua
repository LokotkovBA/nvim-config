require("renamer").setup()
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
