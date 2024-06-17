# <C-y> to scroll up (instead of sending DSUSP) --------------------------------
if stty -a | grep dsusp >/dev/null 2>&1; then
  function no_dsusp() {
    term_settings=$(stty -g)                      # Capture old termio params
    target_bin=$(type -P "$1")                    # Capture target program
    shift                                         # Remove from pos. parameters
    stty dsusp undef                              # Disable DSUSP
    trap 'rc=$?; stty '"$term_settings"'; exit $rc' 0 1 2 3 15
                                                  # Restore termios on interrupt
    $target_bin "$@"                              # Run target program
    stty "$term_settings"                         # Restore termios on exit
  }

  cmd_prefix="no_dsusp "
else
  function no_dsusp() {
    "$@"
  }
fi

# mbsync wrapper ---------------------------------------------------------------
# Queue up another instance of mbsync
# (to begin after the current one terminates)--
# but never queue up more than two instances at a time
function mutt() {
  no_dsusp $(type -P neomutt || type -P mutt)
  last_queued_pid=$(pgrep -f mbsync | tail --lines=1)
  running_instance_pid=$(pgrep -x mbsync | head --lines=1)

  if [ "$last_queued_pid" = "$running_instance_pid" ]; then
    ( sh -c "while ps -p "$running_instance_pid"; do sleep 1; done; mbsync --all --verbose --config \"$HOME/.config/mbsync/config\" >/tmp/$USER.mbsync.log 2>&1" & ) >/dev/null 2>&1
  fi
}
