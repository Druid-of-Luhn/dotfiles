execute pathogen#infect()

set nocompatible		" Use Vim defaults instead of 100% vi compatibility
set hidden				" Allow hiding unsaved buffers
set history=100			" Keep 100 lines of history
set laststatus=2		" Always display status line
set ruler				" Show the cursor position
set number				" Line numbers in gutter on left

let mapleader=" "		" Use big spacebar as leader

syntax on				" Syntax highlighting
filetype plugin indent on

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
set title				" Set title of terminal window
set noerrorbells		" Don't beep
set wildmenu			" Make tab completion for files work like bash
set autoread			" Automatically reload files changed outside of vim
set ttyfast				" Optimize for fast terminal connections

" Spelling is only checked in markdown and text files (.vim/after/ftplugin)
" setlocal spell spelllang=en_gb

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
" Map auto-completion to ,-tab
imap <Leader><tab> <C-x><C-o>
" Map next/previous error message to ,-n/,-m
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>m :lprev<CR>
" Easy way to remove highlight from search
nnoremap <Leader><Leader> :noh<CR>
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Don't make backups
set nobackup
set nowritebackup

" Status line
:set statusline=%<%f\ %y\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c\ \|\ %P%)

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" --------------------- "
" ------ PLUGINS ------ "
" --------------------- "

" Markdown
let g:vim_markdown_folding_disabled=1

" Syntastic
let g:syntastic_javascript_checkers=["jshint"]
let g:syntastic_java_checkers=["javac"]
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1	  " Add errors to error list

" Change Haskell indentation defaults
let g:haskell_indent_if=2
let g:haskell_indent_case=4

" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map="<C-p>"
let g:ctrlp_cmd="CtrlP"
let g:ctrlp_working_path_mode="ra"
let g:ctrlp_custom_ignore={
	\ "dir": "\v[\/]\.git|\.hg|\.sass_cache|bin|node_modules$",
	\ "file": "\v*\.(DS_STORE|aux|class|out|pyc$",
	\ }
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files']
let g:ctrlp_show_hidden=1

" UltiSnips
let g:UltiSnipsSnippetsDir=".vim/snips"
let g:UltiSnipsSnippetDirectories=["snips"]

" NERDTree
map <C-\> :NERDTreeToggle<CR>

" Buftabline
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>[ :bprev<CR>

" Dispatch
autocmd FileType java let b:dispatch="javac -d bin src/**/*.java"
nnoremap <Leader>r :Make<CR>
nnoremap <Leader>b :Dispatch<CR>

" Airline
let g:airline_powerline_fonts = 1
