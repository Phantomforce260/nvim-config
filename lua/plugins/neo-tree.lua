-- Neo-tree is a file explorer plugin for Neovim that provides a
-- sidebar tree view of the filesystem, buffers, and git status.

return {
    -- Main Neo-tree plugin
    "nvim-neo-tree/neo-tree.nvim",

    -- Load Neo-tree when the :Neotree command is run or when <leader>z is pressed
    cmd = "Neotree",

    -- Use the v3.x branch for stability
    branch = "v3.x",
    -- Neo-tree dependencies: plenary, devicons, nui
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
        "MunifTanjim/nui.nvim",
    },

    -- Configure Neo-tree with custom settings
    config = function()
        require("neo-tree").setup({
            -- Enable viewing git status and invisible files
            enable_git_status = true,
            open_on_setup = false,
            filesystem = {
                filtered_items = {
                    visible = true,
                }
            },
        })
    end
}