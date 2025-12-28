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

set undofile
set signcolumn=yes

syntax on
set encoding=utf-8

colorscheme slate

command W w
command Q q

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

hi Normal guibg=NONE ctermbg=NONE
