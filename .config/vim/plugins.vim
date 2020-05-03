" Config index:
"   1. Plugin manager configuration
"   2. Nerd Tree
"   3. Vimtex
"   4. Goyo
"   5. Vimwiki
"   6. Ale
"   7. Ctrl-P
"
"========================================
" 1. Plugin manager configuration
"========================================
" Install plugin manager
if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.config/vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'kovetskiy/sxhkd-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'whonore/Coqtail'
Plug 'let-def/vimbufsync'
call plug#end()

"========================================
" 2. Nerd Tree
"========================================
let g:NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=40

nmap <leader>nn :NERDTreeToggle<CR>

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"========================================
" 3. Vimtex
"========================================
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

"========================================
" 4. Goyo
"========================================
let g:goyo_width=100
let g:goyo_margin_top=5
let g:goyo_margin_bottom=5
nnoremap <silent> <leader>z :Goyo<CR>

"========================================
" 5. Vimwiki
"========================================
let g:vimwiki_list = [{'path': '~/documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"========================================
" 6. Ale
"========================================
let g:ale_completion_enabled = 1

"========================================
" 7. Ctrl-P
"========================================
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = "^\.git"
