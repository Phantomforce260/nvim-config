set splitbelow
set splitright

set ignorecase

set hlsearch

set number
set relativenumber

set termguicolors
set cursorline

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=0
set autoindent

set showmatch

set signcolumn=yes

syntax on
set encoding=utf-8

colorscheme slate

command W w
command Q q

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

hi Normal guibg=NONE ctermbg=NONE

" Ensure required directories exist (plug-and-play)
for dir in ['~/.vim/backup', '~/.vim/swap', '~/.vim/undo']
  if !isdirectory(expand(dir))
    call mkdir(expand(dir), 'p', 0700)
  endif
endfor

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set undofile
