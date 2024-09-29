return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
    opts = {
        exclude = {
            filetypes = { "dashboard", "NvimTree", "Lazy" },
            buftypes = { "terminal" },
        }
    }, 
	config = function()
		require("ibl").setup(opts)
	end
}
