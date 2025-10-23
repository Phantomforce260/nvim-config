-- Alpha is a plugin that displays a start screen when Neovim launches (on VimEnter).
-- It shows a header (ASCII art), menu buttons for common actions, and a footer with plugin stats, version, and date/time.
-- It uses 'nvim-web-devicons' for icons in the menu.

--- @type LazyPluginSpec
return {
    -- Main Alpha plugin (dashboard)
    "goolord/alpha-nvim",
    -- Show dashboard on VimEnter
    event = "VimEnter",
    -- Use devicons for pretty icons in menu
    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- Dashboard options: header, buttons, highlights
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        -- Set header (ASCII art)
        dashboard.section.header.val = require("ascii").lunarflame_logo

        -- Set menu buttons for common actions
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "   > Find file", ":cd $HOME/Documents | Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
        }

        -- Set highlight groups for buttons and shortcuts
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end

        -- Set highlight groups for header, buttons, and footer
        dashboard.section.header.opts.hl = "Function"
        dashboard.section.buttons.opts.hl = "Identifier"
        dashboard.section.footer.opts.hl = "Function"
        dashboard.opts.layout[1].val = 4

        return dashboard
    end,

    -- Dashboard config: setup and dynamic footer
    config = function(_, dashboard)
        local alpha = require("alpha")

        -- Initialize dashboard with options
        alpha.setup(dashboard.opts)

        -- Update footer after LazyVim loads, showing plugin stats, date/time, version
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                -- Helper: get Neovim version string
                local function vim_version()
                    local v = vim.version()
                    local dev = ""
                    if v.prerelease == "dev" then
                        dev = "-dev+" .. v.build
                    else
                        dev = ""
                    end
                    return " " .. v.major .. "." .. v.minor .. "." .. v.patch .. dev
                end

                -- Helper: get plugin load info from Lazy
                local function plugin_load_info()
                    local stats = require("lazy").stats()
                    local plugins_count = stats.loaded .. "/" .. stats.count
                    local load_time = math.floor(stats.startuptime + 0.5)
                    return " " .. plugins_count .. " plugins loaded in " .. load_time .. "ms"
                end

                -- Helper: get current date and time
                local function date_time()
                    local time = vim.fn.strftime("%H:%M:%S")
                    local date = vim.fn.strftime("%m.%d.%Y")
                    return "󰃭 " .. date .. "  " .. time
                end

                local plugins_loaded = plugin_load_info()
                local version_string = vim_version()
                local datetime_string = date_time()
                local plugins_str_length = vim.fn.strdisplaywidth(plugins_loaded)

                -- Center-align footer lines under plugin stats
                dashboard.section.footer.val = {
                    [[ ]],
                    [[ ]],
                    plugins_loaded,
                    string.rep(" ", (plugins_str_length - vim.fn.strdisplaywidth(datetime_string)) / 2 ) .. datetime_string,
                    string.rep(" ", (plugins_str_length - vim.fn.strdisplaywidth(version_string)) / 2 ) .. version_string,
                }
                pcall(vim.cmd.AlphaRedraw)
            end
        })

        -- Disable folding in the dashboard buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}