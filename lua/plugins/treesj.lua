return {
	'Wansmer/treesj',
	keys = { '<space>m', '<space>j' },
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require('treesj').setup({--[[ your config ]]})
	end
}