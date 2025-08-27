function SetTheme(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)


    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })

    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end
