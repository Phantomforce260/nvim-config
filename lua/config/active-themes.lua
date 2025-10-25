local themes = {
    -- Supports transparency
    {
        "catppuccin",
        "dracula",
    },
    {
        "gruvbox",
        "gruvbox_dark",
    },
    {
        "tokyonight",
        "nightfly",
    },
    {
        "nord",
        "nord",
    },
    {
        "mellow",
        "seoul256"
    }
}
-- Change the index to switch themes

math.randomseed(os.time())
local themeIndex = math.random(#themes)

local vimTheme = themes[themeIndex][1] or "catppuccin"
local lualineTheme = themes[themeIndex][2] or "dracula"

return {
    vimTheme = vimTheme,
    lualineTheme = lualineTheme,
}


