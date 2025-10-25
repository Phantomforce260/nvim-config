-- This script contains Neovim LSP (Language Server Protocol) configs
-- They are included here to keep all LSP-related settings centralized,
-- so that if any changes are needed, they can be made in one place.

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem = {
                documentationFormat = { "markdown", "plaintext" },
                snippetSupport = true,
                preselectSupport = true,
                insertReplaceSupport = true,
                labelDetailsSupport = true,
                deprecatedSupport = true,
                commitCharactersSupport = true,
                tagSupport = { valueSet = { 1 } },
                resolveSupport = { 
                    properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits",
                    } 
                },
            }

            require("mason-lspconfig").setup({})
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["intelephense"] = function()
                    require("lspconfig").intelephense.setup({
                        capabilities = capabilities,
                        settings = {
                            intelephense = {
                                environment = {
                                    includePaths = { "/var/www" },
                                }
                            },
                        },
                    })
                end,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- LSP configurations are handled in mason-lspconfig setup
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "L3MON4D3/LuaSnip" },         -- Required
        },
        config = function()
            local lsp = require("lsp-zero").preset({})
            local cmp = require("cmp")

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            cmp.setup({
                mapping = {
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                }
            })

            lsp.setup()
        end,
    },
}