if hash gcloud >/dev/null 2>&1; then
  if [ -r "$HOME/.local/opt/google-cloud-sdk/path.zsh.inc" ]; then
    source "$HOME/.local/opt/google-cloud-sdk/path.zsh.inc" >/dev/null 2>&1
  fi

  if [ -r "$HOME/.config/google-cloud/credentials/sandbox-999579a1f6e9.json" ]; then
    export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/google-cloud/credentials/sandbox-999579a1f6e9.json"
  fi
fi
