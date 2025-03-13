vim.g.mapleader = " "


local function map(mode, lhs, rhs, opt)
	opts = opt or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- map("n", "<leader>pv", vim.cmd.Ex) -- stay just in case i delete oil.lua
map({"i","c"}, "jk", "<Esc>")

map("n", "<leader>q", "<CMD>q<CR>")
-- Basic commands
--map("n", "<leader>w", "<CMD>w<CR>")
-- I am removing this habit but you can keep it. Just uncomment the above two lines

map({"n", "v"}, "<leader>y", [["+y]])

-- move line up and down
map("v", "<leader>j", ":m '>+1<CR>gv=gv")
map("v", "<leader>k", ":m '>-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "=ap", "ma=ap'a")


map("n", "<C-n>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", "<cmd>so<CR>")
