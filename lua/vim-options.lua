vim.g.mapleader = ";" 
vim.keymap.set("n", "<leader>w", "<C-w>l")

vim.keymap.set("n", "<leader>q", function()
    local ft = vim.bo.filetype

    if ft ~= "oil" then
        vim.cmd("Neotree close")
    end

    vim.cmd("Oil")
end, { desc = "Escape to Oil and hide Neo-tree" })

vim.cmd("set number")
vim.cmd("set mouse=a")
vim.cmd("syntax enable")
vim.cmd("set showcmd")
vim.cmd("set encoding=utf-8")
vim.cmd("set showmatch")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=0")
vim.cmd("set softtabstop=0")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-l>', '<C-w>l',{})

vim.api.nvim_set_keymap('n', '<leader>w', '', {
    noremap = true,
    silent = true,
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local buf_ft = vim.api.nvim_buf_get_option(buf, 'filetype')

        -- Neo-tree buffers usually have filetype 'neo-tree'
        if buf_ft == 'neo-tree' then
            -- Neo-tree is focused, switch to previous window
            vim.cmd('wincmd p')
        else
            -- Focus Neo-tree window if it exists, otherwise open it
            local found_neo_tree_win = nil
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local win_buf = vim.api.nvim_win_get_buf(win)
                local win_buf_ft = vim.api.nvim_buf_get_option(win_buf, 'filetype')
                if win_buf_ft == 'neo-tree' then
                    found_neo_tree_win = win
                    break
                end
            end

            if found_neo_tree_win then
                vim.api.nvim_set_current_win(found_neo_tree_win)
            end
        end
    end
})

