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
#                          ZSH USER COMMAND SHORTCUTS
#===============================================================================

function emount() {
  local DEV="$1"
  local MOUNT_DEV="ciphered_dev"

  if [ -z $DEV ] || [ ! -e $DEV ]; then
    printf "ERROR: Bad Device Argument.\n"
    return -1
  fi

  sudo cryptsetup luksOpen $DEV $MOUNT_DEV
  if [ $? -ne 0 ]; then
    return -1
  fi

  sudo mkdir -p "/media/filipe/$MOUNT_DEV"
  sudo mount "/dev/mapper/$MOUNT_DEV" "/media/filipe/$MOUNT_DEV"

  printf "Mounted in '/media/filipe/$MOUNT_DEV'\n"
  printf "Run: eumount $MOUNT_DEV. To unmount and close encrypted drive.\n"
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
