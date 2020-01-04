" This configuration was inpired from:
" https://github.com/LukeSmithxyz/voidrice/blob/master/.config/nvim/init.vim

"===============================================================================
"== Plugin Manager
"===============================================================================
" Install plugin manager
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
call plug#end()

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

"===============================================================================
"== Plugin configuration
"===============================================================================


"==========================================================
"=> Nerd Tree
"==========================================================
let g:NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35

nmap <leader>nn :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"==========================================================
"=> Powerline vim
"==========================================================
" Powerline vim
let g:powerline_pycmd="py3"
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

"==========================================================
"=> Airline vim
"==========================================================
let g:airline_theme="angr"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

" Unicode Symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"==========================================================
"=> Vimtex
"==========================================================
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
nmap <leader>l :VimtexCompile<CR>

"==========================================================
"=> Goyo
"==========================================================
let g:goyo_width=100
let g:goyo_margin_top=5
let g:goyo_margin_bottom=5
nnoremap <silent> <leader>z :Goyo<CR>
