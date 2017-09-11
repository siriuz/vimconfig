" Vim-plug config
call plug#begin('~/.config/nvim/plugged')
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
call plug#end()


colorscheme badwolf
syntax enable               " enable syntax processing


" Tab handling

set tabstop=4               " number of visual spaces per tab
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces


" UI Config

set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
filetype indent on          " load filetype-specific indent files
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{( )}]


" Searching

set incsearch               " incremental search
set hlsearch                " highlight matches


" Movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk


" Leader Shortcuts

let mapleader=","           " leader key is comma
inoremap jk <esc>

nnoremap <leader>s :mksession<CR>  " save session

let g:airline_powerline_fonts = 1


let g:ackprg = 'ag --nogroup --nocolor --column'
