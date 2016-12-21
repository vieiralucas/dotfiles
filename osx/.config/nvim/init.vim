source ~/.config/nvim/plugins.vim

" theme
syntax enable
colorscheme Benokai
set background=dark

" make backspace behave in a sane manner
set backspace=indent,eol,start

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

" line numbers
set relativenumber
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

" move code blocks easier
vnoremap < <gv
vnoremap > >gv

" highlight current line
set cursorline
" highlight CursorLine cterm=none ctermbg=DarkGrey
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
" set incsearch               " set incremental search, like modern browsers
" set nolazyredraw            " don't redraw while executing macros

" nerdtree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " only show files that are not ignored by git

" neomake
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

autocmd! BufWritePost * Neomake

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='bubblegum'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" vim-flow
let g:flow#autoclose = 1
let g:flow#timeout = 10

" vim jsx
let g:jsx_ext_required = 0 " enable even is extension is not .jsx
