return {
  "justinmk/vim-sneak",
  event = "VeryLazy",
  config = function()
    -- Sneak configuration
    vim.g["sneak#label"] = 1
    vim.g["sneak#smart_case"] = 1

    -- Replace 'f' with 1-char Sneak
    vim.keymap.set('n', 'f', '<Plug>Sneak_f')
    vim.keymap.set('n', 'F', '<Plug>Sneak_F')
    vim.keymap.set('x', 'f', '<Plug>Sneak_f')
    vim.keymap.set('x', 'F', '<Plug>Sneak_F')
    vim.keymap.set('o', 'f', '<Plug>Sneak_f')
    vim.keymap.set('o', 'F', '<Plug>Sneak_F')

    -- Replace 't' with 1-char Sneak
    vim.keymap.set('n', 't', '<Plug>Sneak_t')
    vim.keymap.set('n', 'T', '<Plug>Sneak_T')
    vim.keymap.set('x', 't', '<Plug>Sneak_t')
    vim.keymap.set('x', 'T', '<Plug>Sneak_T')
    vim.keymap.set('o', 't', '<Plug>Sneak_t')
    vim.keymap.set('o', 'T', '<Plug>Sneak_T')


    -- 2-char Sneak
    vim.keymap.set('n', 's', '<Plug>Sneak_s')
    vim.keymap.set('n', 'S', '<Plug>Sneak_S')
  end,
}
