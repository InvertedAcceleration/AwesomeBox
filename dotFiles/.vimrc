let s:running_windows = has("win16") || has("win32") || has("win64")

set nocompatible
set noexrc
set history=9999
set timeoutlen=300
set backspace=indent,eol,start
set backup
set clipboard+=unnamed
if s:running_windows
    set backupdir=~/vimfiles/backup
    set directory=~/vimfiles/temp
else
    set backupdir=~/.vim/backup
    set directory=~/.vim/temp
endif
set fileformats=unix,dos,mac
set hidden
filetype off
set encoding=utf-8
set fenc=utf-8
scriptencoding utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" http://vimawesome.com/ great place for more plugins
" http://vi-improved.org/vimrc.html great reference for more settings

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-abolish'
Plugin 'takac/vim-hardtime'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'evidens/vim-twig'
Plugin 'StanAngeloff/php.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on
syntax enable

try
    colorscheme solarized
    call togglebg#map("<F5>")
catch
endtry

set background=dark
set number
set numberwidth=5
set laststatus=2
set incsearch
set lazyredraw
set report=0
set ruler
set linespace=0
set list
set listchars=tab:>-,trail:-
set matchtime=5
set hlsearch
set cindent
set scrolloff=10
set shortmess=aOstT
set showcmd
set showmatch
set noshowmode
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nomore
set noerrorbells
set novisualbell
set nostartofline
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=list:longest
set completeopt=menuone
set formatoptions=rq
set ignorecase
set infercase
set nowrap
set shiftround
set smartcase
set nofoldenable

let mapleader = ' '
let g:netrw_liststyle = 3
let g:hardtime_default_on = 1
let g:lightline = { 'colorscheme': 'solarized' }

nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>
map <C-e> :E<CR>
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir': '\.git$\|\.hg$\|\.svn$|vendor$|cache$|log$', 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'find %s -type f'
let g:ctrlp_user_command = { 'types': { 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'] }, 'fallback': s:ctrlp_fallback }
