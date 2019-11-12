call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ianks/vim-tsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }

call plug#end()

colorscheme nord
set background=dark

let mapleader = ","

set number
set relativenumber
set cursorline
set clipboard=unnamed
set nohlsearch
syntax off
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set invlist
set list
set listchars=eol:¬,trail:⋅

" ts
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

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

nnoremap <silent> <leader>, :Files<CR>

" nerdtree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

" coc
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-tslint-plugin',
\ 'coc-prettier',
\ 'coc-html',
\ 'coc-yank'
\ ]

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-doHover)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd FileType json syntax match Comment +\/\/.\+$+

