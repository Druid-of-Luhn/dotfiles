let mapleader=" "	    " Use spacebar as leader

set hidden			    " Allow hiding unsaved buffers
set history=100		    " Keep 100 lines of history
set ruler			    " Show the cursor position
set number			    " Line numbers in gutter on left

syntax enable		    " Syntax highlighting
set background=dark     " Use dark background
colorscheme dark        " Use 'dark' colourscheme

filetype plugin indent on
" Enable file type detection
filetype on
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
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" Search
set hlsearch			" Highlight search terms
set incsearch			" Highlight dynamically as pattern is typed
set ignorecase          " Ignore searchcase
set smartcase			" If search is lower case, ignore case

" Shell
set shell=bash
set title			    " Set title of terminal window
set noerrorbells		" Don't beep
set wildmenu			" Make tab completion for files work like bash
set ttyfast			    " Optimize for fast terminal connections

" Vim ignores these files
set wildignore=tags,*.swp,*.swo,*.bak,*.pyc,*.class
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Mapping
" Forgot to sudo vim
cmap w!! w !sudo tee % >/dev/null
" Stop q: window from popping up
map q: :q
" Allow navigating wrapped line
nnoremap j gj
nnoremap k gk
" Y yanks to end of line
nnoremap Y y$
" Map auto-completion to " "-tab
imap <Leader><tab> <C-n>
" Easy way to remove highlight from search
nnoremap <Leader><Leader> :noh<CR>
" Jump to end of pasted text
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Move around splits with <c-hjkl>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Only applied to neovim
if has("nvim")
    " And same for terminal
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-l> <C-\><C-n><C-w>l
    " Use Esc to exit Terminal mode
    tnoremap <Esc> <C-\><C-n>
endif

" Don't make backups
set nobackup
set nowritebackup

" Reload if changed elsewhere
set autoread
" Understand mac file formats
set fileformats+=mac
" Open file browser in tree mode
let g:netrw_liststyle=3
nnoremap <leader>\ :Vex<CR>

" Add include locations
set path+=/usr/local/Cellar/sdl2/2.0.3/include

" --------------------- "
" ------ PLUGINS ------ "
" --------------------- "

" Plug
call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" On-demand loading
Plug 'bruno-/vim-man', { 'on': ['Man', 'Vman', 'Mangrep'] }
Plug 'edkolev/tmuxline.vim', { 'on': 'ThisWillNeverHappen' }
Plug 'kien/rainbow_parentheses.vim', { 'for': ['lisp', 'scheme'] }
Plug 'kovisoft/slimv', { 'for': 'lisp' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck', 'for': 'java' }
call plug#end()

" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map="<C-p>"
let g:ctrlp_cmd="CtrlP"
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader>f :CtrlPLine<CR>
let g:ctrlp_working_path_mode="ra"
let g:ctrlp_custom_ignore={
	\ "dir": "\v[\/]\.git|\.hg|\.sass_cache|bin|node_modules$",
	\ "file": "\v*\.(DS_STORE|aux|class|log|out|pyc)$",
	\ }
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command=[".git/", "git --git-dir=%s/.git ls-files -oc --exclude-standard"]
endif
let g:ctrlp_show_hidden=1
let g:ctrlp_extensions=["buffertag", "line"]

" Syntastic
nnoremap <leader>l :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_wq=0
let g:syntastic_c_compiler_options="-fsyntax-only -Wall -Wextra"

" Rainbow Parentheses
autocmd BufNewFile,BufRead *.scm,*.lisp RainbowParenthesesToggle
