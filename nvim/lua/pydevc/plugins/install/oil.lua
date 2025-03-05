return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			natural_order = "fast",
			case_insensitive = false,
			lsp_file_methods = {
				enabled = false,
			},
			view_options = {
				show_hidden = true,
				-- This function defines what is considered a "hidden" file
				is_hidden_file = function(name, bufnr)
					local m = name:match("^%.")
					return m ~= nil
				end,
				-- Customize the highlight group for the file name
				--[[ highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                    return nil
                end, ]]
				--
			},
		})
		vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
