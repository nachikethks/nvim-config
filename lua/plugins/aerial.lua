return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>"),

    config = function()
       require('aerial').setup({
           backends = {'treesitter', 'lsp'},

           -- optionally use on_attach to set keymaps when aerial has attached to a buffer
           on_attach = function(bufnr)
               -- Jump forwards/backwards with '{' and '}'
               vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
               vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
           end,
       })
    end
}
