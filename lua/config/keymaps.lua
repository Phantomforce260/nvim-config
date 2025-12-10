-- Set the leader key to semicolon
local leader = "<leader>"

-- Leader key mappings
local leader_binds = function()

    local plugins = {
        -- `telescope.builtin` exposes common pickers like find_files, live_grep
        telescope = require("telescope.builtin"),
        -- `oil` provides a minimal file explorer within Neovim
        oil = require("oil"),
    }

    local c = require("functions.commands")
    local commands = {
        quit_to_oil = function()
            c.quit_to_oil(plugins.oil)
        end,
        focus_neotree = c.focus_neotree,
        up_dir = c.up_dir,
    }

    return {
        -- q: If in Oil, go up a directory
        UpDirectory = {
            leader .. "q",
            commands.up_dir,
            "Go up a directory in Oil"
        },

        -- aq: Quit all buffers and open Oil
        QuitToOil = {
            leader .. "aq",
            commands.quit_to_oil,
            "Quit all and open Oil"
        },

        -- w: Switch focus between current window and Neotree
        SwitchToNeotree = {
            leader .. "w",
            commands.focus_neotree,
            "Switch focus to Neotree"
        },

        -- e: Toggle Telescope file finder
        FindFiles = {
            leader .. "e",
            plugins.telescope.find_files,
            "Open Telescope file finder"
        },

        -- r: Toggle Neotree file explorer
        NeotreeToggle = {
            leader .. "r",
            ":Neotree toggle<CR>",
            "Toggle Neotree file explorer"
        },

        -- ty: Open a new vertical terminal with toggleterm
        ToggleTerminal = {
            leader .. "ty",
            ":TermNew size=70 direction=vertical<CR>",
            "Toggle terminal"
        },

        -- th: Hide/Show all terminals
        ToggleAllTerminals = {
            leader .. "th",
            ":ToggleTerm<CR>",
            "Hide/Show all terminals"
        },

        -- g: Open Telescope live grep
        LiveGrep = {
            leader .. "g",
            plugins.telescope.live_grep,
            "Open Telescope live grep"
        },
    }
end

local movement_binds = {

    -- Ctrl + (h/j/k/l OR Arrows): Move between windows
    {"<C-h>", "<C-w>h", "Move to left window"},
    {"<C-j>", "<C-w>j", "Move to bottom window"},
    {"<C-k>", "<C-w>k", "Move to top window"},
    {"<C-l>", "<C-w>l", "Move to right window"},
    {"<C-Left>", "<C-w>h", "Move to left window"},
    {"<C-Down>", "<C-w>j", "Move to bottom window"},
    {"<C-Up>", "<C-w>k", "Move to top window"},
    {"<C-Right>", "<C-w>l", "Move to right window"},

    -- Ctrl + Shift + (h/j/k/l OR Arrows): Resize windows
    {"<C-S-h>", ":resize -2<CR>", "Resize window smaller horizontally"},
    {"<C-S-l>", ":resize +2<CR>", "Resize window larger horizontally"},
    {"<C-S-j>", ":vertical resize -2<CR>", "Resize window smaller vertically"},
    {"<C-S-k>", ":vertical resize +2<CR>", "Resize window larger vertically"},

    -- Ctrl + Alt + ]: Next Buffer
    {"<C-A-]>", ":BufferNext<CR>", "Next buffer"},
    -- Ctrl + Alt + [: Previous Buffer
    {"<C-A-[>", ":BufferPrevious<CR>", "Previous buffer"},

    -- Ctrl + 1-0: Go to buffer #
    {"<C-1>", ":BufferGoto 1<CR>", "Go to buffer 1"},
    {"<C-2>", ":BufferGoto 2<CR>", "Go to buffer 2"},
    {"<C-3>", ":BufferGoto 3<CR>", "Go to buffer 3"},
    {"<C-4>", ":BufferGoto 4<CR>", "Go to buffer 4"},
    {"<C-5>", ":BufferGoto 5<CR>", "Go to buffer 5"},
    {"<C-6>", ":BufferGoto 6<CR>", "Go to buffer 6"},
    {"<C-7>", ":BufferGoto 7<CR>", "Go to buffer 7"},
    {"<C-8>", ":BufferGoto 8<CR>", "Go to buffer 8"},
    {"<C-9>", ":BufferGoto 9<CR>", "Go to buffer 9"},
    {"<C-0>", ":BufferLast<CR>", "Go to last buffer"},
}

-- Register all bindings programmatically to avoid repetitive calls
-- Each entry in `binds` is expected to be a table: { lhs, rhs, description }
-- where `rhs` can be a function or a string command. This loop uses normal
-- mode for all mappings; if you need different modes you can extend the
-- structure (see suggestions below).
local function set_binds(binds)
    for _, map in pairs(binds) do
        local lhs = map[1]
        local rhs = map[2]
        local desc = map[3]

        if lhs and rhs then
            vim.keymap.set("n", lhs, rhs, { desc = desc })
        end
    end
end

--  Leader bindings
set_binds(leader_binds()) 

-- Movement bindings
set_binds(movement_binds)

-- Terminal mode: Esc to exit to normal mode
vim.api.nvim_set_keymap(
    "t",
    "<Esc>",
    "<C-\\><C-n>",
    { noremap = true, silent = true }
)

vim.api.nvim_create_user_command(
    "W",
    function() vim.cmd("w") end, 
    {}
)

vim.api.nvim_create_user_command(
    "Q",
    function() vim.cmd("q") end, 
    {}
)

return {
    leader_binds = leader_binds,
    movement_binds = movement_binds,
}
