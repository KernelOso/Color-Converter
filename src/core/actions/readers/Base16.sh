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
  background=$(yq -r '.base00' "$1" | sed 's/^#//')
  foreground=$(yq -r '.base07' "$1" | sed 's/^#//')
  cursor=$(yq -r '.base07' "$1" | sed 's/^#//')

  b_black=$(yq -r '.base00' "$1" )
  b_red=$(yq -r '.base01' "$1" )
  b_green=$(yq -r '.base02' "$1" )
  b_yellow=$(yq -r '.base03' "$1" )
  b_blue=$(yq -r '.base04' "$1" )
  b_magenta=$(yq -r '.base05' "$1" )
  b_cyan=$(yq -r '.base06' "$1" )
  b_white=$(yq -r '.base07' "$1" )

  l_black=$(yq -r '.base08' "$1" )
  l_red=$(yq -r '.base09' "$1" )
  l_green=$(yq -r '.base0A' "$1" )
  l_yellow=$(yq -r '.base0B' "$1" )
  l_blue=$(yq -r '.base0C' "$1" )
  l_magenta=$(yq -r '.base0D' "$1" )
  l_cyan=$(yq -r '.base0E' "$1" )
  l_white=$(yq -r '.base0F' "$1" )

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