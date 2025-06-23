return {
    "nvim-neo-tree/neo-tree.nvim", 
    cmd = "Neotree",  -- Only load when :Neotree is run
    keys = {
        { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neotree" },
    },
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
        require("neo-tree").setup({
            enable_git_status = true,
            open_on_setup = false,
            filesystem = {
                filtered_items = {
                    visible = true,
                }
            }
        })
    end
}
