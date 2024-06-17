if hash fzf >/dev/null 2>&1; then
  if [ -r /usr/local/share/fzf/key-bindings.bash ]; then
    source /usr/local/share/fzf/key-bindings.bash >/dev/null 2>&1
  fi

  if [ -r /usr/local/share/fzf/completion.bash ]; then
    source /usr/local/share/fzf/completion.bash >/dev/null 2>&1
  fi
fi
