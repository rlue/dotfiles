if [ "$(type -t dlt)" = "alias" ]; then
	unalias dlt
fi

function dlt() {
  mins_to_next_qt_hour=$(("15 - $(date +%M) % 15"))

  if [ $mins_to_next_qt_hour -eq 1 ]; then
    mins_to_next_qt_hour=16
  fi

  timer -qd $(("60 * ($mins_to_next_qt_hour - 1) - $(date +%S)")) -r -1 15 &
  disown
}

