"========================================
" Plugin manager configuration
"========================================
" Install plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin(stdpath('data') . '/plugged' )
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'whonore/Coqtail'
Plug 'let-def/vimbufsync'
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'neovimhaskell/haskell-vim'
Plug 'sheerun/vim-polyglot'
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'bfrg/vim-cpp-modern'
Plug 'EdenEast/nightfox.nvim'
" Plug 'ryanoasis/vim-devicons' Icons without colours
"Plug 'akinsho/bufferline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'anufrievroman/vim-angry-reviewer'
Plug 'lilydjwg/colorizer'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'neovim/nvim-lspconfig'
Plug 'vimwiki/vimwiki'
call plug#end()

"========================================
" Nvim-tree
"========================================

nmap <leader>nn :NvimTreeToggle<CR>

"========================================
" Vimtex
"========================================
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_compiler_method = 'latexmk'
"    \ 'build_dir' : 'build',
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let maplocalleader = ","

"========================================
" Ale
"========================================
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'Err'
let g:ale_echo_msg_warning_str = 'Wrn'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 

"========================================
" Ctrl-P
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

map <leader>jj :Files<CR>
map <leader>js :Rg<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"========================================
" Lightline
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
" Colorscheme
"========================================
let g:gruvbox_contrast_dark = 'light'
let g:gruvbox_contrast_light = 'light'

"let g:solarized_termcolors=256

"function FlipBackground()
"  if (&background == "dark")
"    set background=light
"    colorscheme dawnfox
"  else
"    set background=dark
"    colorscheme duskfox
"  endif
"endfunction
"
"map <leader>f :call FlipBackground()<CR>

set termguicolors
set background=light

colorscheme dayfox

" hi Normal guibg=NONE ctermbg=NONE

"========================================
" Angry Reviewer
"========================================

let g:AngryReviewerEnglish = 'british'
nnoremap <leader>ar :AngryReviewer<cr>

"========================================
" Vimwiki
"========================================

let g:vimwiki_list = [{'path': '~/doc/wiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0

"========================================
" lua configuration
"========================================

lua << END
require'lualine'.setup {
    options = {theme = 'dayfox'}
}

require'nvim-tree'.setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'T', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['ocamllsp'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['texlab'].setup{
  on_attach = on_attach,
  flags = ls_flags,
}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.hls.setup{}

END
