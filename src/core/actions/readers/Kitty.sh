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

  # Save values on variables
  background=$(grep -E '^\s*background' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  foreground=$(grep -E '^\s*foreground' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  cursor=$(grep -E '^\s*cursor' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_black=$(grep -E '^\s*color0' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_black=$(grep -E '^\s*color8' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_red=$(grep -E '^\s*color1\s' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_red=$(grep -E '^\s*color9' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_green=$(grep -E '^\s*color2' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_green=$(grep -E '^\s*color10' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_yellow=$(grep -E '^\s*color3' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_yellow=$(grep -E '^\s*color11' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_blue=$(grep -E '^\s*color4' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_blue=$(grep -E '^\s*color12' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_magenta=$(grep -E '^\s*color5' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_magenta=$(grep -E '^\s*color13' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_cyan=$(grep -E '^\s*color6' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_cyan=$(grep -E '^\s*color14' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_white=$(grep -E '^\s*color7' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_white=$(grep -E '^\s*color15' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

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