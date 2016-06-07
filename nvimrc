"call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

"Looks
Plug 'powerline/fonts'
Plug 'altercation/vim-colors-solarized' 
Plug 'bling/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'freeo/vim-kalisi'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
"git
Plug 'airblade/vim-gitgutter' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive' 
"rainbow brackets
Plug 'oblitum/rainbow' 
"autoformatting!
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator' 
"searching and file browser
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' 
Plug 'jistr/vim-nerdtree-tabs' 
Plug 'scrooloose/nerdcommenter' 
"very important - text objects
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-repeat' 
"autopairs!
Plug 'jiangmiao/auto-pairs' 
"fuzzy search engine for files & methods
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky' 
"as the name suggests fixes light typos automatically
Plug 'reedes/vim-litecorrect' 
"textobjects
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote' 
Plug 'kana/vim-textobj-indent'
Plug 'michaeljsmith/vim-indent-object'
"easymotion
Plug 'easymotion/vim-easymotion' 
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
"select closest text object with ENTER
Plug 'gcmt/wildfire.vim'
"syntax checker
Plug 'scrooloose/syntastic' 
Plug 'vim-scripts/a.vim'
"CPP'
Plug 'octol/vim-cpp-enhanced-highlight' 
"autocompleteion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"self explanatory
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-smooth-scroll'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'terryma/vim-multiple-cursors'
"yankring
Plug 'maxbrunsfeld/vim-yankstack'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Add plugins to &runtimepath
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required
setglobal fileencoding=utf-8
set encoding=utf-8
set shell=/bin/zsh
syntax enable
filetype on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax Highlighting octol/enhanced cpp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set termguicolors
colorscheme kalisi
"colorscheme brogrammer
set t_Co=256
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True gui colors in terminal
set background=dark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tmux configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set virtualedit=onemore
"inoremap <Esc><Esc>`^
set ttyfast
if !has('nvim')
    set ttymouse=xterm2
endif 
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8
set clipboard=unnamed
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs & Indentations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:\|\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
"autocmd FileType c,cpp,python,xml 

"autocmd BufWritePre <buffer> call TrailingWhitespace() 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set invlist
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

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
"set t_vb=
set tm=500
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "       " leader is comma
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Keymappings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":set macmeta
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nmap <leader>w :w!<cr>

nmap <leader>w :w!<cr>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <leader>j :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>
nmap <leader>k :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Easier split navigation                                                                                                                               
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
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
nnoremap Y y$
vnoremap . :normal .<CR>
cmap w!! w !sudo tee % >/dev/null
" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
map zl zL
map zh zH
nnoremap <silent> <leader>q gwip



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
let g:ackprg = 'ag --nogroup --nocolor --column'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Smooth Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Latex Box
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if s:extfname ==? "tex"
"let g:LatexBox_split_type="new"
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Ctrl P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CtrlP settings
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_matchtype = 'path'
if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
endif
noremap <C-a> :CtrlP ~<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> YouCompleteMe Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
"set tags+=~/.vim/tags/tes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>let g:UltiSnipsExpandTrigger = "<nop>"
"let g:ulti_expand_or_jump_res = 0
"function ExpandSnippetOrCarriageReturn()
    "let snippet = UltiSnips#ExpandSnippetOrJump()
    "if g:ulti_expand_or_jump_res > 0
        "return snippet
    "else
        "return "\<CR>"
    "endif
"endfunction
""inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>""ttags
"inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>b :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MultipleCursor Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''""

"g:multi_cursor_insert_maps={'!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1, '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1, '<':1, '>':1}
"g:multi_cursor_visual_maps={'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme = 'dark'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
set ttimeoutlen=50


" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
"if isdirectory(expand("~/.vim/bundle/vim-airline/"))
"if !exists('g:airline_powerline_fonts')
"" Use the default set of separators with a few customizations
"let g:airline_left_sep='›'  " Slightly fancier than '>'
"let g:airline_right_sep='‹' " Slightly fancier than '<'
"endif
"endif
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Yankring config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Plugin Settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree {
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif
" }
"" Fugitive {
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif
"}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> ASTYLE Formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ASTYLE formatter
let g:formatterpath = ['/usr/local/bin', '/usr/bin/tidy']
let g:autoformat_autoindent = 1
"let g:autoformat_verbosemode=1

"cpp 
"let g:formatdef_my_astyle_cpp = '"astyle --mode=c --style=allman -pcH".(&expandtab ? "s".&shiftwidth : "t")'
"let g:formatdef_my_astyle_cpp = '"astyle --options=.astylerc ".(&expandtab ? "s".&shiftwidth : "t")'
let g:formatdef_my_astyle_cpp = '"astyle --style=allman --mode=c --attach-namespaces --indent-namespaces --indent-modifiers --indent-switches --indent-col1-comments --break-blocks --pad-oper --pad-paren-out --pad-header --align-pointer=type --remove-brackets -pcH".(&expandtab ? "s".&shiftwidth : "t")'
let g:formatters_cpp = ['my_astyle_cpp']
let g:formatters_c = ['my_astyle_cpp']
let g:formatters_cc = ['my_astyle_cpp']

noremap <F3> :Autoformat<CR>
"au BufWrite * :Autoformat


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize NERDTree as needed {
function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> EASYMOTION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap <Leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-bd-f)
nmap t <Plug>(easymotion-bd-t2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_use_upper = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"map  <Leader>w <Plug>(easymotion-bd-w)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> INCSEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

function! s:config_fuzzyall(...) abort
    return extend(copy({
                \   'converters': [
                \     incsearch#config#fuzzy#converter(),
                \     incsearch#config#fuzzyspell#converter()
                \   ],
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Rainbow for Parentheses  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_noConcealCursor=1

:let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_load_separately = [
            \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
            \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
            \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:indentLine_char = '︙'
