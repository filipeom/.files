#!/usr/bin/env zsh

# Default editors
export EDITOR=nvim

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Npm and node
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# Opam
export OPAMROOT="$XDG_DATA_HOME/opam"

# Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
