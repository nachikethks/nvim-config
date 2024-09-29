-- Appearance
vim.opt.nu = true
vim.opt.relativenumber = true

-- Autocommands to toggle relative line numbers on InsertEnter and InsertLeave
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.wo.relativenumber = false  -- Disable relative line numbers in insert mode
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.wo.relativenumber = true   -- Enable relative line numbers when leaving insert mode
    end,
})

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 8
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true

-- Tab / Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 50000

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Behaviour
vim.opt.errorbells = false
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.mouse:append("a")
vim.opt.modifiable = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.virtualedit = "block"
vim.opt.clipboard = "unnamedplus"
