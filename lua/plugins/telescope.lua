-- Telescope is a highly extendable fuzzy finder for Neovim that can search files, buffers,
-- help tags, live grep, LSP locations and more.

return {
    {
        -- The main Telescope plugin (fuzzy finder)
        "nvim-telescope/telescope.nvim",
        -- Pin to a stable tag to avoid unexpected breaking changes
        tag = "0.1.8",
        -- Telescope depends on plenary for utility functions
        dependencies = { "nvim-lua/plenary.nvim" },
        -- Configure Telescope: set up a couple of default keybindings
        config = function()
            -- `telescope.builtin` exposes common pickers like find_files, live_grep
            local builtin = require("telescope.builtin")

            -- Map <leader>e to open the file finder (searches files in the workspace)
            -- Use the normal mode mapping and pass an empty options table.
            vim.keymap.set("n", "<leader>e", builtin.find_files, {})

            -- Map <leader>g to open live_grep which performs ripgrep across the project
            -- (requires ripgrep (`rg`) installed on your system for best results).
            vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
        end
    },

    {
        -- Optional UI extension: replaces some default vim.ui.select prompts
        -- with Telescope's picker UI for a more consistent UX.
        "nvim-telescope/telescope-ui-select.nvim"
    }

}