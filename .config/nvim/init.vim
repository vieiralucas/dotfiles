call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'chriskempson/base16-vim'

call plug#end()

" colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
syntax on

let mapleader = ","

set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set number
set relativenumber
set clipboard=unnamed
set nohlsearch
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set nolist
set signcolumn=number

highlight VertSplit cterm=NONE
highlight LineNr ctermfg=NONE
highlight CursorLineNr ctermfg=NONE
highlight TabLine ctermfg=NONE

" move code blocks easier
vnoremap < <gv
vnoremap > >gv

" make backspace behave in a sane manner
set backspace=indent,eol,start

" disable arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" fzf
nnoremap <silent> <leader>, :Files<CR>

" nerdtree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

