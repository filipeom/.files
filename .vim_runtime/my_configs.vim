"==============================================================================
"                               General Config
"==============================================================================
" General Text
set expandtab
set tabstop=2
set shiftwidth=2

set autoindent
set si
set cinoptions+=j1

" Themes and Colors
colorscheme ron
set number

"==============================================================================
"                                 Key Mappings
"==============================================================================
" Map leader
let mapleader = ","

" Save and quit
map <leader>q :wq<cr>

" Auto ident file
map <leader>i mzgg=G`z

"==============================================================================
"                                   Plugins
"==============================================================================
" Nerd Tree
" Adjusted because of long names in ESof Project
let g:NERDTreeWinSize=30

" Powerline Vim
let g:powerline_pycmd="py3"
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

" Airline Vim
let g:airline_theme="deus"
let g:airline_powerline_fonts=1

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
