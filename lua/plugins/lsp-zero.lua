return
{
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        local cmp = require("cmp")

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        cmp.setup({
            mapping={
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<Enter>'] = cmp.mapping.confirm({select = true}),
            }
        })

        lsp.setup()
    end,
}
