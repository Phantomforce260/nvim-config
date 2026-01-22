local opt = vim.opt

opt.clipboard = "unnamedplus"           -- Synchronizes the system clipboard with Neovim's clipboard
opt.splitbelow = true                   -- New horizontal splits will be below the current window
opt.splitright = true                   -- New vertical splits will be to the right of the current window

opt.wrap = false                        -- Disables line wrapping
opt.conceallevel = 0                    -- Makes text concealed by plugins (like markdown syntax) visible
opt.ignorecase = true                   -- Case insensitive searching

opt.mouse = "a"                         -- Enables mouse support in all modes

opt.hlsearch = true                     -- Highlights all search results
opt.virtualedit = "block"               -- Creates virtual spaces at the end of a line for easier Visual Block selections

opt.termguicolors = true                -- Enables 24-bit RGB color in the terminal
opt.cursorline = true                   -- Highlights the line where the cursor is located

opt.number = true                       -- Shows line numbers
opt.relativenumber = true               -- Shows relative line numbers

opt.tabstop = 4                         -- Number of spaces that a <Tab> counts for
opt.expandtab = true                    -- Converts tabs to spaces
opt.shiftwidth = 0                      -- Number of spaces to use for each step of (auto)indent
opt.softtabstop = 0                     -- Number of spaces that a <Tab> counts for while performing editing operations
opt.smarttab = true                     -- Makes tabbing smarter
opt.autoindent = true                   -- Enables automatic indentation

opt.encoding = "utf-8"                  -- Sets default encoding to UTF-8
opt.showmatch = true                    -- Highlights matching parentheses

opt.undofile = true                     -- Enables persistent undo
opt.signcolumn = "yes"                  -- Always shows the sign column to prevent text shifting

vim.cmd("syntax enable")                -- Enables syntax highlighting
vim.cmd("set whichwrap+=<,>,[,],h,l")   -- Allows the cursor to move to the next/previous line when hitting these keys

vim.o.background = "dark"

vim.diagnostic.config({
    virtual_text = true
})

vim.api.nvim_create_autocmd("Colorscheme", {
    pattern = "*",
    callback = function()
        vim.cmd [[
            hi Normal guibg=none ctermbg=none
            hi NonText guibg=none ctermbg=none
            hi NormalNC guibg=none ctermbg=none
            hi SignColumn guibg=none ctermbg=none
            hi VertSplit guibg=none ctermbg=none
            hi StatusLine guibg=none ctermbg=none
            hi TabLine guibg=none ctermbg=none
            hi LineNr guibg=none ctermbg=none
            hi EndOfBuffer guibg=none ctermbg=none
        ]]
    end,
})
