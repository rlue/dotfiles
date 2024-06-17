# Provides programmable tab-completion for, e.g., git branch names.
# Requires `brew install zsh-completions`,
if hash brew >/dev/null 2>&1 && [ -r "$(brew --prefix)/share/zsh-completions" ]; then
  export FPATH=$(brew --prefix)/share/zsh/site-functions:$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
