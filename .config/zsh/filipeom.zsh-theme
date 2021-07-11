# vim: ft=zsh
username() {
  #echo "%{$fg[blue]%}%n%{$reset_color%}"
  echo "%{$fg[magenta]%}%n%{$reset_color%}"

}

directory() {
  echo "%{$fg[blue]%}%c%{$reset_color%}$(git_prompt_info) "
}

prompt_indicator() {
  #echo "%{$fg[white]%}$%{$reset_color%}"
  echo "$"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%B$(username) in %B$(directory)$(prompt_indicator)%b '
RPROMPT='%(?.%{$fg[green]%}✔.%{$fg[red]%}✘)'
RPROMPT+='%{$reset_color%}'
