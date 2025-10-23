-- Autopairs is a plugin that automatically inserts matching
-- closing characters (like parentheses, brackets, quotes, etc.) as you type.

return {
    -- Main Autopairs plugin
    "windwp/nvim-autopairs",
    -- Load the plugin when entering Insert mode for better startup time
    event = "InsertEnter",
    -- Use default configuration settings
    config = true
}