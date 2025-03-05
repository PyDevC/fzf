return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = { "markdown", "lua", "python", "c", "cpp", "bash" },
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
		})
		vim.keymap.set("n", "<leader>i", "<cmd>Inspect<CR>")
		vim.keymap.set("n", "<leader>it", "<cmd>InspectTree<CR>")
	end,
}
