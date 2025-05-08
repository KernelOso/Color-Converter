#!/usr/bin/env bash

function load_all_formats () {

  local format_dir="$1"

  local formatName=""

  # reset list
  FLAG_FORMATS=()

  if $FLAG_ALL; then
    for format in "$format_dir"* ; do
      formatName=$(basename "$format")
      formatName="${formatName%.*}"
      FLAG_FORMATS+=("$formatName")
    done
  fi

}