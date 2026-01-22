set splitbelow              " New horizontal splits will be below the current window
set splitright              " New vertical splits will be to the right of the current window

set mouse=a                 " Enables using the mouse in (a)ll Vim modes

set ignorecase              " Case insensitive searching
set hlsearch                " Highlights all search results

set number                  " Shows line numbers
set relativenumber          " Shows relative line numbers

set termguicolors           " Enables 24-bit RGB color in the terminal
set cursorline              " Highlights the line where the cursor is located

set tabstop=4               " Number of spaces that a <Tab> counts for
set expandtab               " Converts tabs to spaces
set shiftwidth=4            " Number of spaces to use for each step of (auto)indent
set softtabstop=0           " Number of spaces that a <Tab> counts for while performing editing operations
set autoindent              " Enables automatic indentation
set smarttab                " Makes tabbing smarter

set showmatch               " Highlights matching parentheses

set signcolumn=yes          " Always shows the sign column to prevent text shifting
set virtualedit=block       " Creates virtual spaces at the end of a line for easier Visual Block selections

syntax enable               " Enables syntax highlighting
set encoding=utf-8          " Sets default encoding to UTF-8

colorscheme slate           " Sets Vim colorscheme to "slate"

"set wrap                   " Enable this to allow overflowing lines to wrap

" I type fast, and I have a habit of accidentally typing :W and :Q instead of :w and :q.
" So I just binded :W and :Q to their lowercase counterparts.

command W w
command Q q

" In Insert Mode, change the cursor from a block to the thin line. This should
" have no effect on Windows terminals.
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Make the background transparent. My terminal is transparent and I want to
" keep my background visible.
hi Normal guibg=NONE ctermbg=NONE

" When undodir is enabled, persistent backups are stored in the cwd. This is
" really annoying, so I move them to a dedicated local cache.
for dir in ['~/.vim/backup', '~/.vim/swap', '~/.vim/undo']
  if !isdirectory(expand(dir))
    call mkdir(expand(dir), 'p', 0700)
  endif
endfor

set backupdir=~/.vim/backup// " Directory for backup files (copies of original files before saving)
set directory=~/.vim/swap//   " Directory for swap files (temporary files for unsaved changes and recovery)
set undodir=~/.vim/undo//     " Directory for undo files (persistent undo history across sessions)

set undofile                  " Enable persistent undo (save undo history to files)