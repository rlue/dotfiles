# for pinentry-curses
export GPG_TTY=$(tty)

# Force pinentry-curses in SSH sessions
# (https://gpgtools.tenderapp.com/kb/faq/enter-passphrase-with-pinentry-in-terminal-via-ssh-connection)
[ -n "$SSH_CONNECTION" ] && export PINENTRY_USER_DATA="USE_CURSES=1"
