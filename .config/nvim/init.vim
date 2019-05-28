call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" js, ts
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'ruanyl/vim-sort-imports'

call plug#end()

let mapleader = ","

set number
set relativenumber
set cursorline
set clipboard=unnamed
set nohlsearch
syntax off
let g:loaded_matchparen=1


" move code blocks easier
vnoremap < <gv
vnoremap > >gv

" make backspace behave in a sane manner
set backspace=indent,eol,start

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat=0 
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

nnoremap <silent> <leader>, :Files<CR>

" nerdtree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

let g:deoplete#enable_at_startup = 1

let g:import_sort_auto = 1
