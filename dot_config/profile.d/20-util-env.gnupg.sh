if [ -d "$HOME/.config/gnupg" ]; then
  export GNUPGHOME="$HOME/.config/gnupg"

  if command -v gpgconf >/dev/null 2>&1; then
    export SSH_AUTH_SOCK="`gpgconf --list-dirs agent-ssh-socket`"
    if [ -n "$SSH_AUTH_SOCK" ]; then
      gpgconf --launch gpg-agent
    fi
  fi
fi
