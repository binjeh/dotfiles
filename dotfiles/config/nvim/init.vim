set shell=bash

set rtp+=~/.config/nvim/colors/dracula

set nocompatible
filetype on
filetype plugin on
filetype plugin indent on
set backspace=indent,eol,start

set omnifunc=syntaxcomplete#Complete

set encoding=utf-8
set fileencoding=utf-8

set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

set nowrap
set textwidth=0
set wrapmargin=0

set number
set cursorline

set showmatch
set incsearch
set hlsearch

set noswapfile
set nobackup
set nowritebackup

set mouse=a

noremap <Leader>Y "+y
noremap <Leader>P "+p

set colorcolumn=80,120

set list
set listchars=tab:>-,trail:.

" ==== specific file type settings =============================================
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" ==== plugin settings =========================================================

" darcula settings
:syntax on
colorscheme dracula
let g:dracula_bold=1
let g:dracula_italic=1
let g:dracula_underline=1
let g:dracula_undercurl=1
let g:dracula_inverse=1
let g:dracula_colorterm=1

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" autosave settings
let g:auto_save=1
let g:auto_save_silent=1
let g:auto_save_write_all_buffers=1

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

