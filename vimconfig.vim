set nocompatible
filetype off
set linespace=0
" --- Vim-Plug Plugin Manager
call plug#begin()


" --- Making Vim Look Good ----------------------------
" color schemes
Plug 'crusoexia/vim-dracula'
Plug 'skielbasa/vim-material-monokai'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'dkprice/vim-easygrep' " Better searching
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vitalk/vim-shebang' " -- read shebang to set filetype for highlighting scripts
Plug 'ryanoasis/vim-devicons'
" -- Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" --- fzf alias (under plugin config section) requires brew install
"  the_silver_searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on

syntax on

set mouse=a
" ---- Colors
set background=dark
set termguicolors
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
colorscheme material-monokai

" General Key Bindings

" Copy to clipboard
nnoremap <silent><leader>C :w !pbcopy<CR>
nnoremap <silent><leader>P :r !pbpaste<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> ∆ :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> ˚ :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Git Mappings
nnoremap <silent><space>gs :Gstatus<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <silent><C-b> :Gblame<CR>

" NERDTree
nnoremap <silent><space>t :NERDTreeFind<CR>

" ---- fzf settings
nmap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" --- Nerdtree-tabs
nmap <silent> <leader>t :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowHidden=1

" --- Nerdtree Syntax Highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" --- scrooloose/syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'jruby']


let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '⦿'

highlight link SyntasticErrorSign SignColumn
highlight SyntasticErrorSign guifg=white guibg=red
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight SyntasticStyleWarningSign guifg=red

augroup mySyntastic
  au!
  au FileType text let b:syntastic_mode = "passive"
augroup END

" --- scrooloose/nerdcommenter ---
" dd spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" --- indentLine ---
let g:indentLine_color_term = 237

" --- vim javascript
let g:javascript_plugin_jsdoc = 1

" --- nvim settings
let g:loaded_python_provider=1

" --- General Settings ---
set t_Co=256
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set hlsearch
set colorcolumn=120
set laststatus=2

set fileformat=unix
set signcolumn=yes
