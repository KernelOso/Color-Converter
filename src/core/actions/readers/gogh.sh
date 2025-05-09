#!/usr/bin/env bash

function reader() {
  local file="$1"
  local color_list=()

  local background=""
  local foreground=""
  local cursor=""

  local b_black=""
  local b_red=""
  local b_green=""
  local b_yellow=""
  local b_blue=""
  local b_magenta=""
  local b_cyan=""
  local b_white=""

  local l_black=""
  local l_red=""
  local l_green=""
  local l_yellow=""
  local l_blue=""
  local l_magenta=""
  local l_cyan=""
  local l_white=""

  local format="Gogh"
  log_message "$(get_message "executing_reader") ${format}" "index" 3 "${COLOR_ACTION}" false

  # Save values on variables
  background=$(yq -r '.background' "$1" | sed 's/^#//')
  foreground=$(yq -r '.foreground' "$1" | sed 's/^#//')
  cursor=$(yq -r '.cursor' "$1" | sed 's/^#//')

  b_black=$(yq -r '.color_01' "$1" | sed 's/^#//')
  b_red=$(yq -r '.color_02' "$1" | sed 's/^#//')
  b_green=$(yq -r '.color_03' "$1" | sed 's/^#//')
  b_yellow=$(yq -r '.color_04' "$1" | sed 's/^#//')
  b_blue=$(yq -r '.color_05' "$1" | sed 's/^#//')
  b_magenta=$(yq -r '.color_06' "$1" | sed 's/^#//')
  b_cyan=$(yq -r '.color_07' "$1" | sed 's/^#//')
  b_white=$(yq -r '.color_08' "$1" | sed 's/^#//')

  l_black=$(yq -r '.color_09' "$1" | sed 's/^#//')
  l_red=$(yq -r '.color_10' "$1" | sed 's/^#//')
  l_green=$(yq -r '.color_11' "$1" | sed 's/^#//')
  l_yellow=$(yq -r '.color_12' "$1" | sed 's/^#//')
  l_blue=$(yq -r '.color_13' "$1" | sed 's/^#//')
  l_magenta=$(yq -r '.color_14' "$1" | sed 's/^#//')
  l_cyan=$(yq -r '.color_15' "$1" | sed 's/^#//')
  l_white=$(yq -r '.color_16' "$1" | sed 's/^#//')

  # save values
  color_list+=("$background")
  color_list+=("$foreground")
  color_list+=("$cursor")
  
  color_list+=("$b_black")
  color_list+=("$b_red")
  color_list+=("$b_green")
  color_list+=("$b_yellow")
  color_list+=("$b_blue")
  color_list+=("$b_magenta")
  color_list+=("$b_cyan")
  color_list+=("$b_white")

  color_list+=("$l_black")
  color_list+=("$l_red")
  color_list+=("$l_green")
  color_list+=("$l_yellow")
  color_list+=("$l_blue")
  color_list+=("$l_magenta")
  color_list+=("$l_cyan")
  color_list+=("$l_white")

  # return
  echo "${color_list[@]}"
}