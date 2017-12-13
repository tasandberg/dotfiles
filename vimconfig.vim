set nocompatible
filetype off
set linespace=0
" --- Vim-Plug Plugin Manager
call plug#begin('~/.local/share/nvim/plugged')

" --- Making Vim Look Good ----------------------------
" color schemes
Plug 'flazz/vim-colorschemes'
Plug 'crusoexia/vim-dracula'
Plug 'skielbasa/vim-material-monokai' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

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
Plug 'ngmy/vim-rubocop'

call plug#end()

filetype plugin indent on

syntax on

set mouse=a
" ---- Colors
set background=dark
set termguicolors
colorscheme material-monokai

" General Keymappings

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> ∆ :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> ˚ :set paste<CR>m`O<Esc>``:set nopaste<CR>

" ---- fzf settings
nmap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" --- Vim-Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme='materialmonokai'

" --- Nerdtree-tabs
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowHidden=1

" --- scrooloose/syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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

" --- xolox/vim-easytags settings
set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
" --- majutsushi/tagbar settings
"  open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>

" --- vim javascript
let g:javascript_plugin_jsdoc = 1

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

set fileformat=unix

