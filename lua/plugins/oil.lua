-- Oil is a Neovim plugin that provides a file explorer and management system
-- within Neovim. It allows users to navigate directories, view and manipulate files,
-- and perform file operations directly from the Neovim interface.

return {
    -- The main Oil plugin (file explorer)
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type  oil.SetupOpts

    -- Configuration options for Oil
    opts =  {},
    -- Use devicons for file icons in Oil
    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- Load Oil on startup
    lazy = false,
    -- Setup function to initialize Oil with custom settings
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
        })
    end
}