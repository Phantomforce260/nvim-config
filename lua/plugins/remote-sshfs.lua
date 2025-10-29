return {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require('remote-sshfs').setup({
            connections = {
                ssh_known_hosts = vim.fn.expand "$HOME" .. "/.ssh/known_hosts",
            }
        })
    end,
}
