-- Allowing only global settings 
-- thinking of changing settings for local file types

global = vim.g
global.mapleader = " "
vim.opt.autoindent = true -- only for python, lua, bash
vim.opt.clipboard = "unnamed" -- global
vim.opt.colorcolumn = "80"  -- only for python
-- vim.opt.conceallevel = 1 -- only for markdown files and with obsidian only
vim.opt.expandtab = true -- still thinking
vim.opt.guicursor = "a:blinkon100" -- global
vim.opt.hidden = true -- still thinking
vim.opt.hlsearch = false -- global always
vim.opt.icon = true -- still thinking
vim.opt.inccommand = "split" -- forgot what was it?
vim.opt.incsearch = true -- global
vim.opt.mouse = "a" -- global
vim.opt.number = true -- globa
vim.opt.relativenumber = true -- global
vim.opt.ruler = true -- global
vim.opt.scrolloff = 12 -- global but only for this screen
vim.opt.shiftwidth = 2 -- change later may be for c
vim.opt.showcmd = true -- forgot
vim.opt.showmatch = true -- global
vim.opt.signcolumn = "yes" -- for gitsigns maybe will keep it in gitsigns.lua
vim.opt.smartindent = true -- what was it?
vim.opt.splitbelow = true -- global
vim.opt.splitright = true -- global
vim.opt.syntax = "on" -- global
vim.opt.tabstop = 2 -- only for c for bash and python make it 4 
vim.opt.termguicolors = true -- global
vim.opt.title = true -- global
vim.opt.undofile = true -- global Actually forgot
vim.opt.updatetime = 100 -- global
vim.opt.wrap = false -- global
