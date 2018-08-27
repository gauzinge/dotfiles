"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''""
call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"Looks
Plug 'sheerun/vim-polyglot'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
"Colorschemes
Plug 'morhetz/gruvbox'
Plug 'roosta/srcery'
"To manaage swap files
Plug 'gioele/vim-autoswap'
"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"rainbow brackets
Plug 'luochen1990/rainbow'
"sane Tmux clipboard
Plug 'roxma/vim-tmux-clipboard'
"sane cursor in cmd line vim
Plug 'jszakmeister/vim-togglecursor'
"commenter
Plug 'scrooloose/nerdcommenter'
"autopairs!
Plug 'jiangmiao/auto-pairs'
"textobjects
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
Plug 'kana/vim-textobj-indent'
Plug 'wellle/targets.vim'
"autocompletion
Plug 'ervandew/supertab'
"fuzzy file finding
Plug 'kien/ctrlp.vim'
"easymotion
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
"select closest text object with ENTER
"to jump from src to header and vv with :A
Plug 'vim-scripts/a.vim'
"CPP & root
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'parnmatt/vim-root'
"JavaScript
Plug 'pangloss/vim-javascript'
"CSS
Plug 'hail2u/vim-css3-syntax'
"self explanatory
Plug 'terryma/vim-smooth-scroll'
"SublimeText like multiple Cursors
Plug 'terryma/vim-multiple-cursors'
"yankplugin
Plug 'bfredl/nvim-miniyank'
Plug 'svermeulen/vim-easyclip'
"undotree
Plug 'sjl/gundo.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''""
set nocompatible
set shell=/bin/bash
syntax enable
syntax on
filetype plugin indent on
":set filetype+=.root
":se ft+=.root

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark


colorscheme srcery
let g:srcery_italic=1
let g:srcery_bold=1
let g:airline_theme = 'badwolf'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set cb=unnamedplus
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set laststatus=2
set timeoutlen=200 ttimeoutlen=50
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, Undo and Mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set virtualedit=onemore
set ttyfast
"set ttymouse=xterm2
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set autoread
set ttymouse=xterm2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs & Indentations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:\|\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
"set colorcolumn=81
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set invlist
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set scrolloff=3
set showmode
set showcmd
set hidden
set cursorline
set ttyfast
set ruler
set laststatus=2
"set undofile
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
"set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set so=7
set wildignore=*.o,*~,*.pyc
set cmdheight=2
set ignorecase
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "       " leader is comma

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"avoid having to use the shift key
nnoremap ; :
" use either jk/kj or ii or ` as escape
inoremap jk <Esc>
inoremap kj <Esc>
inoremap ii <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>
vnoremap ii <Esc>
cnoremap jk <Esc>
cnoremap kj <Esc>
"temporary to re-train jk,kj 
inoremap <esc> <nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>w :w!<CR>
"nmap <Leader>w :w!<cr>
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P
" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <leader>j :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
nmap <leader>k :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
"nmap <leader>bl :ls<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
 "Easier split navigation
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
noremap j gj
noremap k gk
" Stupid shift key fixes
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang -nargs=* -complete=file Bd bd<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
nnoremap Y y$
vnoremap . :normal .<CR>
cmap w!! w !sudo tee % >/dev/null
map zl zL
map zh zH
" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"nnoremap <silent> <leader>q gwip

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nmap <silent> ,/ :nohlsearch<CR>
"so $SSHHOME/.sshrc.d/.vim/NERD_commenter.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Smooth Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" => Gundotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>u :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax Highlighting octol/enhanced cpp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
"let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Miniyank config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>n <Plug>(miniyank-cycle)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Easyclip config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyClipUseSubstituteDefaults = 1
"m[motion] or mm to cut
"s[motion] or ss to substitute
"d[motion] or dd does not yank
"c[motion] or cc does not yank
"Ctrl+p and Ctrl+n cycles through next and previous yanks

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> EASYMOTION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-bd-f)
nmap t <Plug>(easymotion-bd-t2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_use_upper = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> autoswap plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autoswap_detect_tmux = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> autopairs plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsUseInsertedCount = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> INCSEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Rainbow for Parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle=3

" Lifted off from http://blog.g14n.info/2013/07/my-vim-configuration.html
" when navigating a folder, hitting <v> opens a window at right side (default
" is left side)
"
" Thank you!
let g:netrw_altv = 1
