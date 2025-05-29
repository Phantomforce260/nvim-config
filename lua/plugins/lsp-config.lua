return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            -- setup lsp capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem = {
                documentationFormat = { "markdown", "plaintext" },
                snippetSupport = true,
                preselectSupport = true,
                insertReplaceSupport = true,
                labelDetailsSupport = true,
                deprecatedSupport = true,
                commitCharactersSupport = true,
                tagSupport = {
                    valueSet = { 1 }
                },
                resolveSupport = {
                    properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits"
                    }
                }
            }

            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                            capabilities = capabilities
                    })
                end,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end
    }
}

