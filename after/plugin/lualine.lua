local sections

if  vim.fn.has('macunix') then
    sections = {
        lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
    }
end

require("lualine").setup({
    options = {
        theme = 'nightfly'
    },
    sections = sections,
})
