function quit_to_oil(oil)
    -- Close all other buffers
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end

    -- Open Oil in the directory of the current buffer
    oil.open()
end

function focus_neotree()
    vim.cmd.Neotree("focus")
end

function up_dir()
    local ft = vim.bo.filetype
    if ft == "oil" then
        vim.cmd("Oil")
    end
end

return {
    quit_to_oil = quit_to_oil,
    focus_neotree = focus_neotree,
    up_dir = up_dir,
}