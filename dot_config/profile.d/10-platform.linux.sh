# Debian ---------------------------------------------------------------------
if ! [ -r /etc/debian_version ]; then
  return
fi

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022
export AUDIODRIVER=alsa

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# set LS_COLORS
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# qt5 theme support
export QT_QPA_PLATFORMTHEME=qt5ct
