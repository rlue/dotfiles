function dlt
  set -l mins_to_next_qt_hour (math "15 - $(date +%M) % 15")

  if [ $mins_to_next_qt_hour -eq 1 ]
    set mins_to_next_qt_hour 16
  end

  timer $argv -qd (math "60 * ($mins_to_next_qt_hour - 1) - $(date +%S)") -r -1 15 &
  disown
end
