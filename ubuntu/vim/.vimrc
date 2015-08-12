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

" colorschemes
Plugin 'chriskempson/base16-vim'

" fugitive
Plugin 'tpope/vim-fugitive'

" vim-airline
Plugin 'bling/vim-airline'

" syntastic
Plugin 'scrooloose/syntastic'

" vim-clojure-highlight
Plugin 'guns/vim-clojure-highlight'

" identLine
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line

" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" NERDTree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1


" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_go_checkers = [] " vim-go does that for me

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " only show files that are not ignored by git

" vim-go
let g:go_fmt_command = "goimports"

" vim thinks that json is javascript
au BufRead,BufNewFile *.json set filetype=json

" identLine
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
let g:indentLine_leadingSpaceChar = '⋅'

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
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none guifg=darkgray" make the highlighting of tabs less annoying
hi NonText ctermfg=7 guifg=darkgray
set showbreak=↪

" swapfiles location
set backupdir=/tmp//
set directory=/tmp//
