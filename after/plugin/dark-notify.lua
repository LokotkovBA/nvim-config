local dn = require('dark_notify')

-- Configure
dn.run({
    schemes = {
        dark  = "catppuccin-mocha",
        light = "catppuccin-latte"
    },
    onchange = function(mode)
        SetTheme()
    end,
})
