#========================================
#=> oh-my-zsh configuration
#========================================
# OH-MY-ZSH Theme 
ZSH_THEME="robbyrussell"

# Case sensitive tab completion
CASE_SENSITIVE="true"

# Waiting dots on tab completion
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git encode64 extract archlinux)

source $ZSH/oh-my-zsh.sh

#========================================
#=> user commands
#========================================

function emount() {
  local DEV="$1"
  local MOUNT_DEV="ciphered_dev"

  if [ -z $DEV ] || [ ! -e $DEV ]; then
    printf "ERROR: Bad Device Argument.\n"
    return -1
  fi

  sudo cryptsetup luksOpen $DEV $MOUNT_DEV
  [ $? -ne 0 ] && return -1

  sudo mkdir -p "/media/filipe/$MOUNT_DEV"
  sudo mount -o rw,nosuid,nodev,relatime "/dev/mapper/$MOUNT_DEV" "/media/filipe/$MOUNT_DEV"

  printf "Successfully mounted in: '/media/filipe/$MOUNT_DEV'\n"
  printf "Safely remove drive with: eumount $MOUNT_DEV\n"
  printf "Goto mounted dir with: cd /media/filipe/$MOUNT_DEV\n"
}

function eumount() {
  local DEV="$1"

  if [ -z $DEV ] || [ ! -e "/media/filipe/$DEV" ]; then
    printf "ERROR: Bad Device Argument.\n"
    return -1
  fi

  sudo umount "/media/filipe/$DEV"
  sudo cryptsetup luksClose $DEV

  sudo rmdir "/media/filipe/$DEV/"
}

#========================================
#=> zsh user configuration 
#========================================
# Include hidden files in autocomplete
_comp_options+=(globdots)

# Add aliases
[ -f "${HOME}/.config/aliasrc" ] && source "${HOME}/.config/aliasrc"

# Syntax highlighting like vim
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
