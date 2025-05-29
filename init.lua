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

vim.api.nvim_create_augroup("OnOilOpenedFile", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    group = "OnOilOpenedFile",
    callback = function()
        local current = vim.api.nvim_buf_get_name(0)
        local stat = vim.loop.fs_stat(current)
        local focused = false

        if stat and stat.type == "file" then
            -- Check if previous buffer was Oil
            local previous_buf = vim.fn.bufnr("#")
            if previous_buf > 0 and vim.api.nvim_buf_is_valid(previous_buf) then
                local ft = vim.api.nvim_buf_get_option(previous_buf, "filetype")
                if ft == "oil" then
                    vim.schedule(function()
                        vim.cmd("Neotree filesystem reveal left")
                    end)
                end
            end
        end
    end
})

vim.api.nvim_create_user_command('Q', function()
    -- Close all neo-tree windows
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
        if ft == 'neo-tree' then
              vim.api.nvim_win_close(win, true)
            end
        end
    -- Then quit current window
    vim.cmd('q')
end, {})

--vim.api.nvim_create_user_command('Q', close_neo_tree_and_quit, {})
--vim.cmd([[command! -bang -nargs=* q execute 'Q']])

vim.api.nvim_create_user_command('W', function()
    vim.cmd('w')
end, {})

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
