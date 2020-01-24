"===============================================================================
"== Settings
"===============================================================================
" Enable filetype plugins
filetype plugin on
filetype indent on

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

"===============================================================================
"== Colors and Fonts
"===============================================================================
syntax enable

set background=dark

set encoding=utf-8

"===============================================================================
"== Text, tab and indent related
"===============================================================================
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

"===============================================================================
"== Misc
"===============================================================================

" Fast editing and reloading of vimrc
map <leader>e :e! ~/.config/nvim/init.vim<CR>
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

set modeline

set number relativenumber

" Enable autocompletion:
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
set splitbelow splitright

"===============================================================================
"== Bindings
"===============================================================================
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight
map <silent> <leader><CR> :noh<CR>

" Shortcutting split naviagtion
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Useful mappings for managing tabs
map <leader>tn : tabnew<CR>
map <leader>to : tabonly<CR>
map <leader>tc : tabclose<CR>
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last access tab
let g:lasttab=1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab=tabpagenr()

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif 
