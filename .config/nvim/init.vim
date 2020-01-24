" This configuration was inpired from:
" https://github.com/LukeSmithxyz/voidrice/blob/master/.config/nvim/init.vim
" 
" Separated the configurations into three files:
"   1. basic.vim      -> Contains a basic nvim configuration
"   2. plugins.vim    -> Contains plugin manager and plugin configuration
"   3. my_configs.vim -> If it exists it must contain the user configuration file

source ~/.config/nvim/basic.vim
source ~/.config/nvim/plugins.vim

try
  source ~/.config/nvim/my_configs.vim
catch
endtry
