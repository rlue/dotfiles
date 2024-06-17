# Readline shortcuts -----------------------------------------------------------
# enable ^o (operate-and-get-next)
tty -s && stty discard undef

# enable ^s (i-search, cf. ^r)
# (see http://blog.bigsmoke.us/2013/08/05/readline-shortcuts-ctrl-s-and-xoff)
tty -s && stty -ixon

# History ----------------------------------------------------------------------
# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

export HISTFILESIZE=100000
export HISTSIZE=10000

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# set terminal prompt colors
export PS1="\[\033[0;93m\]\u@\h\[\033[m\]\[\033[0;31m\]:\w \$ \[\033[m\]"

# Misc. ------------------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
