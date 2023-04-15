function SetTheme(color)
	color = color or "astrotheme"
	vim.cmd.colorscheme(color)
end

SetTheme()
