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
    },

    {
        -- Optional UI extension: replaces some default vim.ui.select prompts
        -- with Telescope's picker UI for a more consistent UX.
        "nvim-telescope/telescope-ui-select.nvim"
    }

}