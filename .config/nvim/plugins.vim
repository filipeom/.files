" Config index:
"   1. Plugin manager configuration
"   2. Nerd Tree
"   3. Vimtex
"   4. Goyo
"   5. Vimwiki
"   6. Ale
"   7. Ctrl-P
"   8. lightline
"   9. Colorscheme
"
"========================================
" 1. Plugin manager configuration
"========================================
" Install plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin(stdpath('data') . '/plugged' )
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'whonore/Coqtail'
Plug 'let-def/vimbufsync'
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}
Plug 'morhetz/gruvbox'
Plug 'neovimhaskell/haskell-vim'
call plug#end()

"========================================
" 2. Nerd Tree
"========================================
let g:NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=30

nmap <leader>nn :NERDTreeToggle<CR>

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"========================================
" 3. Vimtex
"========================================
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '_build',
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
let g:ale_echo_msg_error_str = 'Err'
let g:ale_echo_msg_warning_str = 'Wrn'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 

"========================================
" 7. Ctrl-P
"========================================
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

map <leader>j :Files<CR>
map <leader>s :Rg<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"========================================
" 8. lightline
"========================================
"let g:lightline = {
"  \ 'colorscheme' : 'powerline',
"  \ 'active' : {
"  \   'left' : [ ['mode', 'paste'],
"  \              ['fugitive', 'readonly', 'filename', 'modified'] ],
"  \   'right' : [ ['lineinfo'], 
"  \               ['percent'],
"  \               ['fileformat', 'fileencoding', 'filetype'] ]
"  \ },
"  \ 'component' : {
"  \   'readonly' : '%{&filetype=="help"?"":&readonly?"🔒":""}',
"  \   'modified' : '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"  \   'fugitive' : '%{exists("*FugitiveHead")?FugitiveHead():""}'
"  \ },
"  \ 'component_visible_condition': {
"  \   'readonly': '(&filetype!="help"&& &readonly)',
"  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"  \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
"  \ 
"  \ },
"  \ }

"========================================
" 9. colorscheme
"========================================
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
