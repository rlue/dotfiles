if hash fzf >/dev/null 2>&1; then
  local keybindings_script=$(/usr/bin/find /opt/homebrew/Cellar/fzf -name key-bindings.zsh | sort --version-sort | tail -n1)
  if [ -r "$keybindings_script" ]; then
    source "$keybindings_script" >/dev/null 2>&1
  fi

  local completion_script=$(/usr/bin/find /opt/homebrew/Cellar/fzf -name key-bindings.zsh | sort --version-sort | tail -n1)
  if [ -r "$completion_script" ]; then
    source "$completion_script" >/dev/null 2>&1
  fi
fi
