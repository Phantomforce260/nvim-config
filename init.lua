
-- Synchronizes the system clipboard with Neovim's clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Does not wrap text that overflows.
vim.opt.wrap = false

-- Creates virtual spaces at the end of a line for easier
-- Visual Block selections.
vim.opt.virtualedit = "block"

-- vim.opt.scrolloff = 999

-- See commands in nvim/lua/vim-optiond.lua
require("vim-options")

-- Set up lazy.nvim -----------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-------------------------------------------------------

-- Sets the colorscheme to a built-in.
-- The default is catppuccin
-- vim.cmd.colorscheme("slate")
