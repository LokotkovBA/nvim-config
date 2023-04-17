local builtin = require('telescope.builtin');
vim.keymap.set('n', '<leader>pf', builtin.find_files, {});
vim.keymap.set('n', '<C-p>', builtin.git_files, {});
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ str = vim.fn.input("Grep > ") });
end);

local telescope = require("telescope")
local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end
local actions = require("telescope.actions")
telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
        },
    },
}

telescope.load_extension("file_browser")

vim.keymap.set("n", "<C-f>", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }
    })
end)
