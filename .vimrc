" Show line numbers
set number
"Show selative line numbers
set relativenumber
"Highlight the current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=gray
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
"Auto indent
set autoindent
"Tab setting
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=0
set smarttab
"KEYMAP
inoremap jj <Esc>
