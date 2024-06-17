# depends:
# * 20-util-env.gnupg.sh
# * 20-util-env.pass.sh
if command -v restic >/dev/null 2>&1; then
  export B2_ACCOUNT_ID="$(pass web/backblaze/master.id 2>/dev/null || pass web/backblaze/$(hostname).id)"
  export B2_ACCOUNT_KEY="$(pass web/backblaze/master.key 2>/dev/null || pass web/backblaze/$(hostname).key)"
  export RESTIC_REPOSITORY="b2:$(hostname)"

  if pass "web/backblaze/$(hostname).repo" >/dev/null 2>&1; then
    export RESTIC_PASSWORD_COMMAND="pass web/backblaze/$(hostname).repo"
  fi
fi
