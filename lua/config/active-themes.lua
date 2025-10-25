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

    -- Does not support transparency
    { 
        "nord",
        "nord",
    },
}
-- Change the index to switch themes
local themeIndex = 3

local vimTheme = themes[themeIndex][1] or "catppuccin"
local lualineTheme = themes[themeIndex][2] or "dracula"

return {
    vimTheme = vimTheme,
    lualineTheme = lualineTheme,
}


