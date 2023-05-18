function SetTheme(color)
    color = color or "everblush"
    vim.cmd.colorscheme(color)
end

SetTheme()
