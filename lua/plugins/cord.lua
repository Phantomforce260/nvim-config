-- Cord is a Discord Rich Presence integration for Neovim,
-- showing your current editing status in your Discord profile.

return {
    -- The main Cord plugin
    "vyfor/cord.nvim",
    -- Run :Cord update after installing/updating the plugin to update parsers
    build = ":Cord update",
}