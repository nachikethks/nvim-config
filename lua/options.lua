-- Appearance
vim.opt.nu = true
vim.opt.relativenumber = true

-- Autocommands to toggle relative line numbers on InsertEnter and InsertLeave
vim.api.nvim_create_autocmd("InsertEnter", {
    desc = "Disable relative line numbers in insert mode",
    callback = function()
        vim.wo.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "Enable relative line numbers when leaving insert mode",
    callback = function()
        vim.wo.relativenumber = true
    end,
})


vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- The following two autocommands are used to highlight references of the
-- word under your cursor when your cursor rests there for a little while.
--    See `:help CursorHold` for information about when this is executed
--
-- When you move your cursor, the highlights will be cleared (the second autocommand).
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'cursorhold', 'cursorholdi' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'cursormoved', 'cursormovedi' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('lspdetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end
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
vim.opt.wrap = false

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
