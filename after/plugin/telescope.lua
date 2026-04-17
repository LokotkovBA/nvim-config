require("telescope").setup({})

local preview_utils = require("telescope.previewers.utils")
preview_utils.ts_highlighter = function(bufnr, ft)
    local lang = vim.treesitter.language.get_lang(ft) or ft
    if not lang or lang == "" then
        return false
    end

    return pcall(vim.treesitter.start, bufnr, lang)
end

local builtin = require('telescope.builtin');
vim.keymap.set('n', '<leader>pf', builtin.find_files, {});
vim.keymap.set('n', '<C-p>', builtin.git_files, {});
vim.keymap.set('n', '<leader>ps', function()
    vim.ui.input({ prompt = "Grep > " },
        function(input)
            if not (input and #input > 0) then
                return
            end
            builtin.grep_string({ search = input });
        end
    )
end);
vim.keymap.set('n', '<leader>pr', function()
    vim.ui.input({ prompt = "Live grep > " },
        function(input)
            if not (input and #input > 0) then
                return
            end
            builtin.live_grep({ default_text = input })
        end
    )
end);
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
