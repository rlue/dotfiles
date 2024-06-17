# Set environment for non-interactive shells (e.g., scripts) ===================
if ! [[ $- =~ i ]]; then
  export GNUPGHOME="$HOME/.config/gnupg"
  export PASSWORD_STORE_DIR="$HOME/.config/pass"
  export PATH="$HOME/.local/bin:$PATH"

  return
fi
