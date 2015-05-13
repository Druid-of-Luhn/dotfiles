set hidden			    " Allow hiding unsaved buffers
set history=100		    " Keep 100 lines of history
set ruler			    " Show the cursor position
set number			    " Line numbers in gutter on left

let mapleader=" "	    " Use spacebar as leader

syntax enable		    " Syntax highlighting
filetype plugin indent on
" Enable file type detection
filetype on
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" Indentation
set tabstop=4			" 4 spaces wide
set shiftwidth=4		" 4 spaces wide using < and >
set softtabstop=4		" 4 spaces wide when writing
set smarttab			" tabs are consistent
set expandtab			" use spaces for tabs
set autoindent
set copyindent			" Copy indentation from previous line
set pastetoggle=<F2>	" Stop vim from badly indenting pasted data

set showmatch			" Show matching brackets, etc

" Search
set hlsearch			" Highlight search terms
set incsearch			" Highlight dynamically as pattern is typed
set smartcase			" If search is lower case, ignore case

" Shell
set shell=bash
set title			    " Set title of terminal window
set noerrorbells		" Don't beep
set wildmenu			" Make tab completion for files work like bash
set ttyfast			    " Optimize for fast terminal connections

" Vim ignores these files
set wildignore=*.swp,*.bak,*.pyc,*.class
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Mapping
" Forgot to sudo vim
cmap w!! w !sudo tee % >/dev/null
" Allow navigating wrapped line
nnoremap j gj
nnoremap k gk
" Y yanks to end of line
nnoremap Y y$
" Map auto-completion to " "-tab
imap <Leader><tab> <C-x><C-o>
" Easy way to remove highlight from search
nnoremap <Leader><Leader> :noh<CR>
" Move around splits with <c-hjkl>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" And same for terminal
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
" Use Esc to exit Terminal mode
tnoremap <Esc> <C-\><C-n>

" Don't make backups
set nobackup
set nowritebackup

" Reload if changed elsewhere
set autoread
" Understand mac file formats
set fileformats+=mac

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
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" On-demand loading
Plug 'bruno-/vim-man', { 'on': ['Man', 'Vman', 'Mangrep'] }
Plug 'edkolev/tmuxline.vim', { 'on': 'ThisWillNeverHappen' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_show_hidden=1
let g:ctrlp_extensions = ["buffertag", "line"]

" NERDTree
nnoremap <leader>\ :NERDTreeToggle<CR>
