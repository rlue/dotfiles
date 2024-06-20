# History ----------------------------------------------------------------------
# don't put duplicate lines or lines starting with space in the history.
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

export SAVEHIST=100000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history

# Force prompt to write history after every command.
setopt INC_APPEND_HISTORY

# set terminal prompt colors
autoload -U colors && colors
export PS1="%{$fg[yellow]%}%n@%m%{$fg[red]%}:%1~ $ %{$reset_color%}"

# Make ^U delete only text before cursor position
# https://unix.stackexchange.com/questions/522663/
bindkey ^U backward-kill-line
