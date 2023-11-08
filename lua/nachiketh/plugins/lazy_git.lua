return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.keymap.set("n", "<leader>gg", "<cmd>:LazyGit<CR>")
    end
}
