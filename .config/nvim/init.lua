vim.g.mapleader = ","

-- Terminal and colorscheme settings
vim.opt.termguicolors = true
vim.opt.background = "light"

-- Editor settings
vim.opt.history = 10000
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.list = false
vim.opt.signcolumn = "number"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlight settings
vim.cmd("highlight VertSplit cterm=NONE")
vim.cmd("highlight LineNr ctermfg=NONE")
vim.cmd("highlight CursorLineNr ctermfg=NONE")
vim.cmd("highlight TabLine ctermfg=NONE")

-- Visual mode mappings for moving code blocks
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- Backspace behavior
vim.opt.backspace = "indent,eol,start"

-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Down>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Left>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Right>", "<NOP>", { noremap = true })
vim.keymap.set("i", "<Up>", "<NOP>", { noremap = true })
vim.keymap.set("i", "<Down>", "<NOP>", { noremap = true })
vim.keymap.set("i", "<Left>", "<NOP>", { noremap = true })
vim.keymap.set("i", "<Right>", "<NOP>", { noremap = true })

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

