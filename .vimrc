" Show line numbers
set number
"Show selative line numbers
set relativenumber
"Highlight the current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=16
"Highlight search parttern
set hlsearch
"Search sensitivity
set ignorecase
set smartcase
"Show the matching part [] {}
set showmatch
"Status bar
set laststatus=2
"Enable mouse support
set mouse=a
"Enable syntax
syntax on

"KEYMAP
inoremap jj <Esc>
