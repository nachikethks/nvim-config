return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
        -- vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
        -- vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
        -- vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
        -- vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    end
}
