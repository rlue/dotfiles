if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$(dirname $(dirname $(which pyenv)))"
fi
