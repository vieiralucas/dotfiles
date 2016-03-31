set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The NERD tree
Plugin 'scrooloose/nerdtree'

" ctrlp.vim
Plugin 'kien/ctrlp.vim'

" jade.vim
Plugin 'digitaltoad/vim-jade'

" Go vim
Plugin 'fatih/vim-go'

" fugitive
Plugin 'tpope/vim-fugitive'

" vim-clojure-highlight
Plugin 'guns/vim-clojure-highlight'

" identLine
Plugin 'Yggdroot/indentLine'

" emmet
Plugin 'mattn/emmet-vim'

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" js hightlight
Plugin 'othree/yajs.vim'

" scala
Plugin 'derekwyatt/vim-scala'

" csapprox
Plugin 'godlygeek/csapprox'

" neocomplete.vim
Plugin 'Shougo/neocomplete.vim'

" vim-colorschemes
Plugin 'flazz/vim-colorschemes'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line

" colorscheme
colorscheme desertEx

" NERDTree
" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
" let g:NERDTreeQuitOnOpen=1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='bubblegum'

" neocomplete.vim
let g:neocomplete#enable_at_startup = 1

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " only show files that are not ignored by git

" vim-go
let g:go_fmt_command = "goimports"

" vim thinks that json is javascript
" maybe its a good idea
" au BufRead,BufNewFile *.json set filetype=json

" use html highlight for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" identLine
let g:indentLine_enabled = 1
" let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
" let g:indentLine_leadingSpaceChar = '⋅'

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" long lines as just one line (have to scroll horizontally)
" set nowrap

" 256 colors
set t_Co=256

" line numbers
set number

" access system clipboard
set clipboard=unnamed

" show the status line all the time
set laststatus=2

" toggle invisible characters
set invlist
set list
set listchars=tab:¦\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none guifg=darkgray" make the highlighting of tabs less annoying
hi NonText ctermfg=7 guifg=darkgray

" swapfiles location
set backupdir=/tmp//
set directory=/tmp//

" maintain terminal background
" hi Normal ctermbg=none

" move code blocks easier
vnoremap < <gv
vnoremap > >gv

" highlight current line
set cursorline
" highlight CursorLine cterm=none ctermbg=DarkGrey
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
