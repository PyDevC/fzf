require("telescope").setup({})
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<leader>gf", builtin.live_grep)
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {hidden = true})
vim.keymap.set("n", "<leader>vh", builtin.help_tags)

-- custom keymap to search command for telescope
-- vim.keymap.set("n", "<leader>c", function()
-- end)

