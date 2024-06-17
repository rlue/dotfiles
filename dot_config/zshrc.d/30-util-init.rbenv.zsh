export RBENV_SHELL=zsh

if [ -r "$(/usr/bin/find $(brew --cellar rbenv) -name rbenv.zsh | sort --version-sort | tail -n1)" ]; then
  source "$(/usr/bin/find $(brew --cellar rbenv) -name rbenv.zsh | sort --version-sort | tail -n1)"
fi
