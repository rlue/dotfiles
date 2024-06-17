function inapt-upgrade() {
  if [ $# -eq 0 ]; then
    command inapt-upgrade && sudo apt update && apt list --upgradable && sudo apt dist-upgrade --autoremove -y
  else
    command inapt-upgrade $@
  fi
}
