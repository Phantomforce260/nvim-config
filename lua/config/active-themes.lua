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
        "habamax",
        "nightfly"
    },
    {
        "lunaperche",
        "nightfly"
    },

    -- Vim 9.1+ themes
    {
        "retrobox",
        "gruvbox_dark"
    },
    {
        "unokai",
        "ayu_dark"
    }
}
-- Change the index to switch themes
local useVimThemes = false
local randomTheme = false

math.randomseed(os.time())
local themeIndex = randomTheme and math.random(useVimThemes and #themes or #themes - 5) or 1

local vimTheme = randomTheme and themes[themeIndex][1] or "catppuccin"
local lualineTheme = randomTheme and themes[themeIndex][2] or "auto"

print("Using theme: " .. vimTheme)

return {
    vimTheme = vimTheme,
    lualineTheme = lualineTheme,
}


