vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>te", "<cmd>:term<CR>")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>j", ":bp<CR>", { desc = "Prev buffer", silent = true })
vim.keymap.set("n", "<leader>k", ":bn<CR>", { desc = "Next buffer", silent = true })

vim.keymap.set("n", "<leader>xs", vim.diagnostic.open_float, { desc = "Open floating diagnostic window" })

local lang_maps = {
	cpp = { build = "g++ % -o %:r", exec = "./%:r" },
	python = { exec = "python %" },
}
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"FileType",
			{ command = "nnoremap <leader>b :!" .. data.build .. "<CR>", pattern = lang }
		)
	end
	vim.api.nvim_create_autocmd(
		"FileType",
		{ command = "nnoremap <leader>e :split<CR>:ter " .. data.exec .. "<CR>", pattern = lang }
	)
end

vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
