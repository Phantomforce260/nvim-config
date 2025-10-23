-- Lualine is a statusline plugin for Neovim. It provides a highly customizable
-- and visually appealing statusline that can display various information
-- about the current editing session, such as file name, mode, branch, diagnostics, etc

return {
    -- The main Lualine plugin
    "nvim-lualine/lualine.nvim",

    -- Lualine depends on 'nvim-web-devicons' for file type icons
    -- However, since we already have it installed via other plugins,
    -- we don't need to specify it again here.
    -- dependencies = { "nvim-tree/nvim-web-devicons" },

    -- Configure Lualine with a specific theme
    config = function()
        require("lualine").setup({
            options = {
                theme = "dracula"
            },
        })
    end
}