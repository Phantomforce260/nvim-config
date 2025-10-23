--  Treesitter provides incremental parsing for many languages which enables
--  more accurate syntax highlighting, better indentation rules, and the
--  foundation for advanced editor features (textobjects, refactoring, etc.).

return {
    -- Main Treesitter plugin (parsers + modules)
    "nvim-treesitter/nvim-treesitter",
    -- Run :TSUpdate after installing/updating the plugin to update parsers
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        -- Configure Treesitter modules and parser installation
        configs.setup({
            -- List of parsers to ensure are installed. Parsers are the language
            -- grammars Treesitter uses to parse files. Keep this list focused
            -- on languages you work with to avoid long install times.
            ensure_installed = { 
                -- Common / required languages
                "lua",
                "c",
                "javascript",
                "vim",
                "vimdoc",
                "query",
                -- Additional languages (optional) — add or remove as needed
                "html",
                "css",
                "php",
                "typescript",
                "c_sharp",
                "java",
                "json"
            },

            -- Automatically install missing parsers when entering a buffer.
            -- NOTE: This requires `tree-sitter` CLI tooling to be available on
            -- some systems. Set to false if you prefer manual parser management.
            auto_install = true,

            -- Enable syntax highlighting using Treesitter
            highlight = { enable = true },

            -- Enable indentation based on the parsed syntax tree. This can be
            -- more accurate than regex-based indentation for some languages.
            indent = { enable = true }
        })
    end
}