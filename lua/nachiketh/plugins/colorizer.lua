return {
    'norcalli/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    config = function()
        local colorizer = require("colorizer")
        colorizer.setup()
    end
}
