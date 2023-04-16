require("astrotheme").setup({
    palette = "astrodark",   -- String of the default palette to use when calling `:colorscheme astrotheme`
    termguicolors = true,    -- Bool value, toggles if termguicolors are set by AstroTheme.
    terminal_color = true,   -- Bool value, toggles if terminal_colors are set by AstroTheme.
    plugin_default = "auto", -- Sets how all plugins will be loaded
    -- "auto": Uses lazy / packer enabled plugins to load highlights.
    -- true: Enables all plugins highlights.
    -- false: Disables all plugins.

    plugins = { -- Allows for individual plugin overides using plugin name and value from above.
        ["bufferline.nvim"] = false,
    },
    palettes = {
        global = {
            -- Globaly accessible palettes, theme palettes take priority.
            my_grey = "#ebebeb",
            my_color = "#ffffff"
        },
    },
})
