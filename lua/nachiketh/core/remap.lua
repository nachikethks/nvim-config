vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffer Navigation
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer", silent = true }) -- next buffer
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Prev buffer", silent = true }) -- prev buffer
vim.keymap.set("n", "<leader>bb", ":e #<CR>", { desc = "Other buffer", silent = true }) -- switch to other buffer

-- Move selected text UP and DOWN
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Up and Down seamlessly on a wrapped line
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep the cursor centered while scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the cursor centered while /search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Select and paste without loosing copied text in register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete text to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Build and execute
local lang_maps = {
	cpp = { build = "g++ % -o %:r", exec = "./%:r" },
	python = { exec = "python %" },
	java = { build = "javac %", exec = "java %" },
}
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"FileType",
			{ command = "nnoremap <leader>bu :!" .. data.build .. "<CR>", pattern = lang }
		)
	end
	vim.api.nvim_create_autocmd(
		"FileType",
		{ command = "nnoremap <leader>ex :split<CR>:ter " .. data.exec .. "<CR>", pattern = lang }
	)
end

-- Toggle Relative Line Number in Insert and Visual Mode
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })

-- Window resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split Window Verically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
