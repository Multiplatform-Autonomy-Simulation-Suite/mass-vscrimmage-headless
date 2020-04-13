#!/bin/bash --login

if [ -n "$*" ]; then
  # shellcheck disable=SC1091
  source /home/scrimmage/.scrimmage/setup.bash
  binary=$(which "$1")
  if [ -x "${binary}" ]; then
    shift
    ${binary} "$@"
  else
    echo "Command ${1} is not executable"
    exit 1
  fi
else
  echo "No command given"
  exit 1
fi
