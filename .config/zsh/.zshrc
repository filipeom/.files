#===============================================================================
#                         OH-MY-ZSH CONFIGURATION
#===============================================================================
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git encode64 extract)

source $ZSH/oh-my-zsh.sh

#===============================================================================
#                          ZSH USER CONFIGURATION
#===============================================================================
# Include hidden files in autocomplete
_comp_options+=(globdots)

if [ -f "${HOME}/.config/aliasrc" ]
then
  source "${HOME}/.config/aliasrc"
fi

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
