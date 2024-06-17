if command -v pass >/dev/null 2>&1; then
  export PASSWORD_STORE_DIR="$HOME/.config/pass"
  export PASSWORD_STORE_EXTENSIONS_DIR="$HOME/.config/pass/ext"
fi
