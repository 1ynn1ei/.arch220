#!/bin/sh

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

. "$SCRIPTPATH/scripts/statusbar/date.sh"
. "$SCRIPTPATH/scripts/statusbar/battery.sh"
. "$SCRIPTPATH/scripts/statusbar/end.sh"

while true
do
  bar=""
  bar="$bar [$(battery)]"
  bar="$bar [$(bar_date)]"
  bar="$bar $(end) "
  xsetroot -name "$bar"
  sleep 1
done
