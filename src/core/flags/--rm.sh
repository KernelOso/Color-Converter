#!/usr/bin/env bash

function remove_file () {

  local file="$1"

  if $FLAG_REMOVE; then

    rm "$file"

  fi
}