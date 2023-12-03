return {
    "ThePrimeagen/harpoon",
    dependencies = {
		"nvim-lua/plenary.nvim",
	},
    config = function()
        local harpoon = require('harpoon')

        -- vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
        -- vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
        -- vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
        -- vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
        -- vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end) 
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end
}
