local themes = {

    -- Neovim themes
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
    },
    {
        "onedark",
        "onedark"
    },
    {
        "vscode",
        "vscode"
    },
    {
        "rose-pine",
        "horizon"
    },

    -- Vim themes
    {
        "slate",
        "ayu_dark"
    },
    {
        "unokai",
        "ayu_dark"
    },
    {
        "retrobox",
        "gruvbox_dark"
    },
    {
        "habamax",
        "nightfly"
    },
    {
        "lunaperche",
        "nightfly"
    },
}
-- Change the index to switch themes

math.randomseed(os.time())
local themeIndex = math.random(#themes)

local vimTheme = themes[themeIndex][1] or "catppuccin"
local lualineTheme = themes[themeIndex][2] or "dracula"

print("Using theme: " .. vimTheme)

return {
    vimTheme = vimTheme,
    lualineTheme = lualineTheme,
}


