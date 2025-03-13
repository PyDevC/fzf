vim.opt.guicursor = ""


vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "80"
vim.opt.conceallevel = 1
vim.opt.expandtab = true
vim.opt.guicursor = "a:blinkon100" -- global
vim.opt.hlsearch = false
vim.opt.icon = true                -- still thinking
vim.opt.inccommand = "split"       -- forgot what was it?
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.mouse = "a"                -- global
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 12             -- global but only for this screen
vim.opt.shiftwidth = 4
vim.opt.showcmd = true             -- forgot
vim.opt.showmatch = true           -- global
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true          -- global
vim.opt.splitright = true          -- global
vim.opt.swapfile = false
vim.opt.syntax = "on"              -- global
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true               -- global
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false
