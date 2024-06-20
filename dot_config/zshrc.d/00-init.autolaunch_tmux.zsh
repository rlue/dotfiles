if [ -z "$SSH_CONNECTION" ] && [ "$XDG_SESSION_TYPE" != tty ]; then
  if [ -z "$TMUX" ]; then
    if infocmp xterm-256color-italic >/dev/null 2>&1; then
      export TERM=xterm-256color-italic
    fi

    if type tmux >/dev/null 2>&1; then
      if tmux ls 2>/dev/null | $(whence -p grep) -qEv "\(attached\)$"; then
        tmux attach
      elif tmux ls 2>/dev/null | $(whence -p grep) -q work; then
        tmux new
      else
        tmux new -s work
      fi
    fi
  else # initialize tmux plugins (if possible)
    if [ "$(uname)" = Linux ] || hash greadlink >/dev/null 2>&1; then
      source "$HOME/.config/tmux/tmux-git/tmux-git.sh" >/dev/null 2>&1
    fi
  fi
fi
