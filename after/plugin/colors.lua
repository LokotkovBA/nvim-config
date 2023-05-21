function SetTheme(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)
end

SetTheme()
