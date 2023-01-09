" Config index:
"   1. General
"   2. User Interface
"   3. Colors and Fonts
"   4. Text, tab and indent related
"   5. Statusline
"   6. Misc
"   7. Navigation
"   8. Directories
"
"========================================
" 1. General
"========================================
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when file is updated from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

autocmd BufWritePre * :%s/\s\+$//e

" Leader
let mapleader=","

"========================================
" 2. User Interface
"========================================
" Always show current position
"set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Don't redraw while executing macros
set nolazyredraw

" Add a bit extra margin to the left
set foldcolumn=0

" Set lines around cursor when scrolling
set scrolloff=10

set lcs=tab:>·,trail:·,nbsp:+,eol:¬

" See line breaks and carriage
set list

" Cursor Shape
set guicursor=

set cursorline

set colorcolumn=81

"========================================
" 3. Colors and Fonts
"========================================
" Enable syntax highlighting
syntax enable

" Enable 256 colors
if !has('gui_running')
  set t_Co=256
endif

" Set dark background
set background=dark

" Set utf-8 character encodings
set encoding=utf-8

"========================================
" 4. Text, tab and indent related
"========================================
" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap

"========================================
" 5. Statusline
"========================================
set showmode

" Always show statusline
"set laststatus=2
"
"" Set statusline
"set statusline=
"" Color
"set statusline+=%#StatusLineNC# 
"" Right
"set statusline+=\ %t%m
"set statusline+=%=
"" Left
"set statusline+=%y\ %{&fileencoding?&fileencoding:&encoding}\ [%{&fileformat}]\ %p%%\ %l:%-3c

"========================================
" 6. Misc
"========================================
set mouse=a

set modeline

set number

" Enable auto completion:
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
set splitbelow splitright

" Fast saving
nmap <leader>w :w!<CR>
nmap <leader>q :wq!<CR>

" Fast editing and reloading of vimrc
map <leader>e :e! $XDG_CONFIG_HOME/nvim<CR>
map <leader>r  :source $XDG_CONFIG_HOME/nvim/init.vim<CR>

" Break lines in command mode
map <C-i> i<CR><Esc>
set rtp^="$OPAMROOT/4.14.0/share/ocp-indent/vim"

"========================================
" 7. Navigation
"========================================
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight
map <silent> <leader><CR> :noh<CR>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Useful mappings for managing buffers
map J : BufferPrevious<CR>
map K : BufferNext<CR>
map <leader>bc : BufferClose<CR>

" Useful mappings for managing tabs
map <leader>tn : tabnew<CR>
map <leader>tj : tabprevious<CR>
map <leader>tk : tabNext<CR>
map <leader>to : tabonly<CR>
map <leader>t  :tabnext

" Let 'tl' toggle between this and the last access tab
let g:lasttab=1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab=tabpagenr()

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

"========================================
" 8. Directories
"========================================
set undofile
set undodir=$XDG_DATA_HOME/nvim/undo
set directory=$XDG_DATA_HOME/nvim/swap
set backupdir=$XDG_DATA_HOME/nvim/backup
set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
