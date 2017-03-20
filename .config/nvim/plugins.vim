call plug#begin('~/.config/nvim/plugged')

" utils
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'

" ui
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" html / templates
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support

" JavaScript
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support
Plug 'flowtype/vim-flow' " JSX support

" styles
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" go
Plug 'fatih/vim-go', { 'for': 'go' }

" clojure
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" elm
Plug 'lambdatoast/elm.vim', { 'for': ['elm'] }

" typescript
Plug 'leafgarland/typescript-vim'

call plug#end()
