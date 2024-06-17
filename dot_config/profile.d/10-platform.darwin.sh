# ls colors
export CLICOLOR=1

# Homebrew ---------------------------------------------------------------------
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Prevent `GitHub API rate limit exceeded` error
# per https://gist.github.com/christopheranderton/8644743
if command -v brew >/dev/null 2>&1 && command -v pass >/dev/null 2>&1; then
  export HOMEBREW_GITHUB_API_TOKEN=`pass web/github/rlue-homebrew-token 2>/dev/null`
fi
