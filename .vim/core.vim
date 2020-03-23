"========================================
"=> General
"========================================
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when file is updated from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

" Leader
let mapleader=","

" Fast saving
nmap <leader>w :w!<CR>
nmap <leader>q :wq!<CR>

" Cursor Shape
set guicursor=

"========================================
"=> User Interface
"========================================
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

" Add a bit extra margin to the left
set foldcolumn=0

" Set lines around cursor when scrolling
set scrolloff=10

"========================================
"=> Colors and Fonts
"========================================
" Enable syntax highlighting
syntax enable

" Set dark background
set background=dark

" Set colorscheme
colorscheme ron

" Set utf-8 character encodings
set encoding=utf-8

"========================================
"=> Text, tab and indent related
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
"=> Misc
"========================================
" Fast editing and reloading of vimrc
map <leader>ee :e! ~/.config/nvim/init.vim<CR>
map <leader>ec :e! ~/.config/nvim/core.vim<CR>
map <leader>ep :e! ~/.config/nvim/plugins.vim<CR>
augroup auto_reload
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
  autocmd BufWritePost ~/.config/nvim/core.vim source ~/.config/nvim/core.vim
  autocmd BufWritePost ~/.config/nvim/plugins.vim source ~/.config/nvim/plugins.vim
augroup END

set modeline

set number relativenumber

" Enable auto completion:
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
set splitbelow splitright

"========================================
"=> Bindings
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

" Useful mappings for managing tabs
map <leader>tn : tabnew<CR>
map <leader>to : tabonly<CR>
map <leader>tc : tabclose<CR>
map <leader>t<leader> :tabnext<CR>

" Let 'tl' toggle between this and the last access tab
let g:lasttab=1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab=tabpagenr()

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

"========================================
"=> Persistent undo on
"========================================
try
  set undodir=~/.config/nvim/undo
  set undofile
catch
endtry
