return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({

            -- Ensures that the following parsers are installed.
            ensure_installed = {
                -- Required --
                "lua",
                "c",
                "javascript",
                "vim",
                "vimdoc",
                "query",
                -- Non-Required --
                "html",
                "css",
                "php",
                "typescript",
                "c_sharp",
                "java",
                "json",
            },

            -- Automatically installs parsers when you enter a new file type.
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
