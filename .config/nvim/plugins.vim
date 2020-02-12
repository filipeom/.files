"===============================================================================
"== Plugin configuration
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
" FIXME: Add runtime path

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
let g:vimtex_view_general_viewer = 'zathura'
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
