function cnxn() {
  if ip addr | grep 'wlp.s0.*state UP' >/dev/null 2>&1; then
    speedtest-cli
  else
    echo 'System offline' >&2
  fi
}
