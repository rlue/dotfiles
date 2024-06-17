#!/usr/bin/env bash

if [ -p /tmp/timer.fifo ]; then
  tail -n1 < /tmp/timer.fifo
else
  date +%R
fi
