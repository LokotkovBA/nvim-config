vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰌵',
        },
    }
})

vim.keymap.set("n", "\\", function()
    require("neo-tree.command").execute({
        action = "show",
        toggle = true,
        reveal = true
    })
end)

require("neo-tree").setup({
    nesting_rules = {
        ["package.json"] = {
            pattern = "^package%.json$",             -- <-- Lua pattern
            files = { "package-lock.json", "yarn*" } -- <-- glob pattern
        },
        ["js-extended"] = {
            pattern = "(.+)%.js$",
            files = { "%1.js.map", "%1.min.js", "%1.d.ts" },
        },
        ["docker"] = {
            pattern = "^dockerfile$",
            ignore_case = true,
            files = { ".dockerignore", "docker-compose.*", "dockerfile*" },
        }
    },
    default_component_configs = {
        git_status = {
            symbols = {
                -- Change type
                added     = "✚",
                modified  = "",
                deleted   = "✖", -- this can only be used in the git_status source
                renamed   = "", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        },
    },
    filesystem = {
        components = {
            harpoon_index = function(config, node, _)
                local Marked = require("harpoon.mark")
                local path = node:get_id()
                local success, index = pcall(Marked.get_index_of, path)
                if success and index and index > 0 then
                    return {
                        text = string.format(" %d", index), -- <-- Add your favorite harpoon like arrow here
                        highlight = config.highlight or "NeoTreeDirectoryIcon",
                    }
                else
                    return {
                        text = "  ",
                    }
                end
            end,
        },
        follow_current_file = {
            enabled = true
        }, -- This will find and focus the file in the active buffer every
        renderers = {
            file = {
                { "icon" },
                { "name",         use_git_status_colors = true },
                { "harpoon_index" },
                { "diagnostics" },
                { "git_status",   highlight = "NeoTreeDimText" },
            },
        },
    },
})
