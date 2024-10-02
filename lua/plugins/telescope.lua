return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
            pickers = {
                find_files = {
                    no_ignore = true,
                },
            },
        })

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
        vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Telescope Live Grep" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope Find Git Files" })
        vim.keymap.set("n", "<leader>fb", function() builtin.buffers({ sort_mru = true, sort_lastused = true }) end,
            { desc = "Telescope Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help" })
        vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Jumplist" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Key Maps" })
        vim.keymap.set('n', '<leader>re', builtin.resume, { desc = "Resume Telescope" })
        vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "List all Vim Autocommands" })
        vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = "List Vim Options" })
    end,
}
