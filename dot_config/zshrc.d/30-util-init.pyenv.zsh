export PYENV_ROOT=${HOME}/.pyenv
export PYENV_SHELL=zsh


if [ -r "$(/usr/bin/find $(brew --cellar pyenv) -name pyenv.zsh | sort --version-sort | tail -n1)" ]; then
  source "$(/usr/bin/find $(brew --cellar pyenv) -name pyenv.zsh | sort --version-sort | tail -n1)"
fi
