[ -r /etc/debian_version ] || return
  
function purge-stale-kernels() {
  for kernel in $(find /boot -maxdepth 1 -name 'vmlinuz*' -type f -printf "%f\n" | sed 's@vmlinuz-@linux-image-@g' | grep -v "$(uname -r)"); do
    sudo apt remove --yes --autoremove --purge "$kernel"
  done
}
