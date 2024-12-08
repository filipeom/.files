vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
