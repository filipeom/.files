#===============================================================================
#                         OH-MY-ZSH CONFIGURATION
#===============================================================================

# OH-MY-ZSH Theme 
ZSH_THEME="robbyrussell"

# Case sensitive tab completion
CASE_SENSITIVE="true"

# Waiting dots on tab completion
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git encode64 extract)

source $ZSH/oh-my-zsh.sh

#===============================================================================
#                          ZSH USER CONFIGURATION
#===============================================================================
# Include hidden files in autocomplete
_comp_options+=(globdots)

# Add aliases
if [ -f "${HOME}/.config/aliasrc" ]
then
  source "${HOME}/.config/aliasrc"
fi

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
