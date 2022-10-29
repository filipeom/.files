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
"Plug 'scrooloose/nerdtree'
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
Plug 'altercation/vim-colors-solarized'
Plug 'neovimhaskell/haskell-vim'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'bfrg/vim-cpp-modern'
Plug 'EdenEast/nightfox.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons' Icons without colours
"Plug 'akinsho/bufferline.nvim'
Plug 'romgrk/barbar.nvim'
" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'anufrievroman/vim-angry-reviewer'
Plug 'lilydjwg/colorizer'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

"========================================
" 2. Tree
"========================================
"let g:NERDTreeWinPos="right"
"let NERDTreeShowHidden=0
"let NERDTreeIgnore=['\.pyc$', '__pycache__']
"let g:NERDTreeWinSize=30
"
"nmap <leader>nn :NERDTreeToggle<CR>

nmap <leader>nn :NvimTreeToggle<CR>

"autocmd BufEnter * if (winnr("$") == 1 && bufwinnr("NvimTree") != -1) | q | endif

"========================================
" 3. Vimtex
"========================================
let g:tex_flavor = 'latex'
"let g:vimtex_view_general_viewer = 'evince-previewer'
let g:vimtex_view_method = 'zathura'
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
set background=dark

colorscheme gruvbox

" hi Normal guibg=NONE ctermbg=NONE

"========================================
" 10. Angry Reviewer
"========================================

let g:AngryReviewerEnglish = 'british'
nnoremap <leader>ar :AngryReviewer<cr>

"========================================
" XXX. pandoc
"========================================

let g:pandoc#syntax#codeblocks#embeds#use = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ['c', 'sh']

augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END

"========================================
" 11. lua configuration
"========================================

lua << END
require'lualine'.setup {
    options = {theme = 'gruvbox'}
}
require'nvim-tree'.setup {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = false,
    interval = 100,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}
END
