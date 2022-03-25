#!/usr/bin/env bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

NOTIFIER=$1; shift || :
if [ -z "$NOTIFIER" ] || [ $# -lt 1 ]; then
  echo "Usage: ./notify.sh 'zenity --notification --text=\"\$results\"' BTC-USD@'\$price > 1000'"
  exit
fi

results=$(NO_COLOR=1 "${SCRIPT_DIR}/ticker.sh" "$@")
if [ -n "$results" ]; then
  eval "$NOTIFIER"
fi
