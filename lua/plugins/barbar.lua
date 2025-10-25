-- Barbar is a Neovim plugin that provides a tabline interface for managing
-- buffers. It allows users to easily switch between open buffers, close buffers,
-- and view buffer information in a visually appealing tabline at the top of the
-- Neovim window.

return {
    -- The main Barbar plugin
    "romgrk/barbar.nvim",
    -- Dependencies for Barbar: Gitsigns for git integration and web-devicons for file icons
    dependencies = { 
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons" 
    },

    -- Disable automatic setup to allow custom configuration
    init = function()
        vim.g.barbar_auto_setup = false
    end,

    -- Configuration options for Barbar
    opts = {},
    -- Version constraint to ensure compatibility
    version = "^1.0.0",
}