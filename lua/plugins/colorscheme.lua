return {
    {
        "sokinpui/onedark-modified",
        lazy = false,
        priority = 1000,
        config = function()
            --enable colorscheme
            require('onedark').setup {
                style = 'dark'
            }
            require('onedark').load()
            --enable status line
            --require("config.lualine")
        end,
    },
}
