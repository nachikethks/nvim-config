return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local blankline = require("ibl")
        blankline.setup {
            exclude = {
                filetypes = { "dashboard", "NvimTree", "Lazy" },
                buftypes = { "terminal" }
            }
        }
    end
}
