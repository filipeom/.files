# vim: ft=zsh

sep() {
  echo -n "%B%{$fg[yellow]%}➜ %{$reset_color%}%b"
}

directory() {
  echo -n "%B%{$fg[blue]%}%c%{$reset_color%}$(git_prompt_info)%b"
}

name() {
  #echo -n "%B%{$fg[red]%}[%{$reset_color%}%b"              # left brace
  #echo -n "%{$fg[blue]%}%n%{$reset_color%}"               # username
  echo -n "%B%{$fg[cyan]%}%n%{$reset_color%}%b"            # username
  #echo -n "%B%{$fg[yellow]%}@%{$reset_color%}%b"           # @
  #echo -n "%B%{$fg[cyan]%}$(hostname)%{$reset_color%}%b"   # hostname
  echo -n " $(sep) "
  directory
  #echo -n "%B%{$fg[red]%}]%{$reset_color%}%b"              # right brace
}

prompt_indicator() {
  echo "%B%{$fg[white]%}$%{$reset_color%}%b"
  #echo "$"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"

PROMPT='$(name) $(prompt_indicator)%b '
RPROMPT='%(?.%{$fg[green]%}✔.%{$fg[red]%}✘)'
RPROMPT+='%{$reset_color%}'
