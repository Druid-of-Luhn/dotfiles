let mapleader=" "	    " Use spacebar as leader

set hidden			    " Allow hiding unsaved buffers
set history=100		    " Keep 100 lines of history
set laststatus=1        " Only display status line with multiple files
set ruler			    " Show the cursor position
set number			    " Show line numbers

syntax enable		    " Syntax highlighting
set background=dark     " Use dark background
colorscheme dark        " Use 'dark' colourscheme

" Enable file type detection
filetype plugin indent on
" Spell check all files (applies only to comments in code)
set spell spelllang=en_gb

set showmatch			" Show matching brackets, etc

" Indentation
set tabstop=4			" 4 spaces wide
set shiftwidth=4		" 4 spaces wide using < and >
set softtabstop=4		" 4 spaces wide when writing
set smarttab			" tabs are consistent
set expandtab			" use spaces for tabs
set autoindent
set copyindent			" Copy indentation from previous line
set linebreak           " Break lines in sensible places
set pastetoggle=<F2>    " Easily toggle paste mode

" File-specific options
" Set C indentation for C and C++ files
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp setlocal cindent
" Set indentation to tabs for Makefiles
autocmd BufNewFile,BufRead Makefile setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
" Use Lisp mode for Lisp and Scheme files
autocmd BufNewFile,BufRead *.scm,*.sld,*.ss setlocal lisp filetype=scheme tabstop=2 shiftwidth=2 softtabstop=2
" Do not check spelling in Erlang files (it checks code)
autocmd BufNewFile,BufRead *.erl,*.hrl setlocal nospell

" Keep syntax highlighting unbroken
autocmd BufEnter,InsertLeave * :syntax sync fromstart

" Search
set hlsearch			" Highlight search terms
set incsearch			" Highlight dynamically as pattern is typed
set ignorecase          " Ignore searchcase
set smartcase			" Do not ignore case when any uppercase character is used

" Files
set path+=**            " Use recursive search for finding files
set wildmenu			" Make tab completion for files work like bash

" Shell
set shell=bash
set title			    " Set title of terminal window
set noerrorbells		" Don't beep
set ttyfast			    " Optimize for fast terminal connections
set shellcmdflag=-lc    " Make the shell interactive to load .bash_profile

" Vim ignores these files
set wildignore=tags,*.swp,*.swo,*.bak,*.pyc,*.class
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Mapping
" Forgot to sudo vim
cmap w!! w !sudo tee % >/dev/null
" Stop q: window from popping up
map q: :q
" Allow navigating wrapped lines
nnoremap j gj
nnoremap k gk
" Y yanks to end of line
nnoremap Y y$
" Easy way to remove highlight from search
nnoremap <Leader><Leader> :noh<CR>
" Jump to end of pasted text
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Search file system with \
nnoremap \ :Ack<space>
" Keep screen redraw shortcut
nnoremap <Leader><C-l> :redraw!<CR>
" Move around splits with <c-hjkl>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Resize splits with <leader-LeftUpRightDown>
nnoremap <Leader><Left> 5<C-w><
nnoremap <Leader><Up> 5<C-w>+
nnoremap <Leader><Right> 5<C-w>>
nnoremap <Leader><Down> 5<C-w>-

" Don't make backups
set nobackup
set nowritebackup

" Reload if changed elsewhere
set autoread
" Understand mac file formats
set fileformats+=mac
" Hide file browser banner
let g:netrw_banner=0
" Open file browser in tree mode
let g:netrw_liststyle=3
" Open file browser with <space>-\
nnoremap <leader>\ :Vex<CR>

" --------------------- "
" ------ PLUGINS ------ "
" --------------------- "

" Plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Druid-of-Luhn/essence.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'keith/swift.vim'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'sersorrel/vim-lilypond', { 'branch': 'main' }
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'vimwiki/vimwiki'
" On-demand loading
Plug 'bhurlow/vim-parinfer', { 'for': ['lisp', 'scheme'] }
Plug 'bruno-/vim-man', { 'on': ['Man', 'Vman', 'Mangrep'] }
Plug 'Druid-of-Luhn/tslime.vim', { 'for': ['lisp', 'scheme'] }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'tpope/vim-fugitive', { 'on': ['Gstatus', 'Gcommit', 'Gdiff'] }
Plug 'w0rp/ale', { 'on': 'ALELint', 'for': [ 'c', 'cpp', 'cs', 'haskell', 'java', 'python', 'rust' ] }
call plug#end()

" Ack/Ag
if executable('ag')
    let g:ackprg='ag --vimgrep'
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('rg')
    let g:ackprg='rg --vimgrep'
endif

" ALE
let g:ale_virtualtext_cursor = 'disabled'

" Ctrl-P
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_map="<C-p>"
let g:ctrlp_cmd="CtrlP"
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader>f :CtrlPLine<CR>
let g:ctrlp_working_path_mode="ra"
" This is actually ignored by the later use of ctrlp_user_command
let g:ctrlp_custom_ignore={
	\ 'dir': '\.git|\.hg|\.sass_cache|\.stack-work|bin|node_modules$',
	\ 'file': '\v*\.(DS_STORE|aux|bin|class|hi|log|o|out|pyc)$',
	\ }
if executable('rg')
    let g:ctrlp_user_command='rg --files --ignore-file ~/.ctrlp-ignore %s'
else
    let g:ctrlp_user_command=[".git/", "git --git-dir=%s/.git ls-files -oc --exclude-standard"]
endif
let g:ctrlp_show_hidden=1
let g:ctrlp_extensions=["buffertag", "line"]
let g:ctrlp_by_filename=1

" GNU Global
map <Leader>] :GtagsCursor<CR>

" Essence
let g:essence_conceal=1

" Tmux Navigator

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed=1

" tslime
vmap <C-c><C-n> <Plug>SendSelectionToTmux
nmap <C-c><C-n> <Plug>NormalModeSendToTmux
vmap <C-c><C-c> <Plug>SendSelectionToTmuxNoNewline
nmap <C-c><C-c> <Plug>NormalModeSendToTmuxNoNewline
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" vimwiki
let wiki = {}
let wiki.path = '$HOME/Documents/vimwiki'
let wiki.path_html = '$HOME/Documents/vimwiki/html'
let g:vimwiki_list = [wiki]
" Disable automatically treating all .md files as wikis
let g:vimwiki_global_ext = 0
