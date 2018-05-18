" Vim-plug config
call plug#begin('~/.config/nvim/plugged')
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tomlion/vim-solidity'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mklabs/split-term.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'mbbill/undotree'
Plug 'chrisbra/Recover.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'elzr/vim-json'
Plug 'kopischke/vim-stay'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()



colorscheme badwolf
syntax enable               " enable syntax processing


" Tab handling

set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=4                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
set encoding=utf-8


" UI Config

set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
filetype indent on          " load filetype-specific indent files
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{( )}]
set scrolloff=6             " keep 6 lines when scrolling
set ruler                   " show current position at bottom
set ls=2                    " always show status line                                                                                               
set noea                    " Keep splits the same size if a split is closed

" Searching

set incsearch               " incremental search
set hlsearch                " highlight matches

" Make s/ command apply interactively

set inccommand=nosplit


" Movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk


" Leader Shortcuts

let mapleader=","           " leader key is comma
inoremap jk <esc>

nnoremap <leader>s :mksession<CR>  " save session

let g:airline_powerline_fonts = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

tnoremap <ESC><ESC> <C-\><C-N>

set splitbelow


" Language Server Configuration

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif


filetype plugin on
set omnifunc=syntaxcomplete#Complete

" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

autocmd FileType json setlocal foldmethod=syntax

" Settings for vim-stay" Settings for vim-stay  
set viewoptions=cursor,folds,slash,unix


" Enable gf for node_modules imports
set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

