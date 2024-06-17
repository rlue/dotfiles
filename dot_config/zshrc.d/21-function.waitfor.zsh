# via http://blog.joncairns.com/2013/03/wait-for-a-unix-process-to-finish/
function waitfor() {
  if [ -z "$1" ]; then
    echo "waitfor: no process name given" >&2
    return 2
  elif [[ "$1" =~ [^[:digit:]] ]]; then
    name="$1"
    pid=$(pgrep -f "$1")
  else
    pid="$1"
    name="$(ps -p "$pid" -o comm=)"
  fi

  if [ $? -ne 0 ] || [[ $pid == *$'\n'* ]]; then
    if [[ $pid == *$'\n'* ]]; then
      echo "waitfor: found multiple processes named \"$name\"" >&2
    elif [ -z "$pid" ]; then
      echo "waitfor: failed to find process \"$name\"" >&2
    else
      echo "waitfor: failed to find process $pid" >&2
    fi

    return 1
  else
    echo "waiting for $name to finish ($pid)"
    while ps -p "$pid" > /dev/null; do sleep 1; done
  fi
}

if hash timer >/dev/null 2>&1; then
  function lmk() {
    waitfor "$1" 2>/dev/null || "$@" ; timer 0 >/dev/null
  }
fi
