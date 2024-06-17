# Provides programmable tab-completion for, e.g., git branch names.
# Requires `brew install bash-completion`,
if hash brew >/dev/null 2>&1 && [ -r "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion" >/dev/null 2>&1
fi
