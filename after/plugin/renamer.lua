require("renamer").setup()
vim.api.nvim_set_keymap('i', '<leader>r', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>r', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
