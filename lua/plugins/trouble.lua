return {
	"folke/trouble.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>xs", vim.diagnostic.open_float, { desc = "Open floating diagnostic window" })
	end,
}
