local global = vim.g

global.mapleader = " "

local function map(mode, lhs, rhs, opt)
	opts = opt or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Exit to file list
-- map("n", "<leader>pv", vim.cmd.Ex) -- habit I got from ThePrimeagen
-- i am using oil.nvim so above line won't work

map({"i","c"}, "jk", "<Esc>")

map("n", "<leader>q", "<CMD>q<CR>")
-- Basic commands
--map("n", "<leader>w", "<CMD>w<CR>")
-- I am removing this habit but you can keep it. Just uncomment the above two lines

-- To toggle wrap
-- needed in rare cases but still often to make a remap
map("n", "<leader>wp", function()
  print("toggle wrap")
  -- if wrap on then
  -- <cmd>set wrap!<CR>
  -- else
  -- <cmd>set wrap<CR>
end)
