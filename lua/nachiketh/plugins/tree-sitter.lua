return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
