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
  background=$(yq -r '.background' "$file" )
  foreground=$(yq -r '.foreground' "$file" )
  cursor=$(yq -r '.cursor' "$file" )

  b_black=$(yq -r '.b_black' "$file" )
  b_red=$(yq -r '.b_red' "$file" )
  b_green=$(yq -r '.b_green' "$file" )
  b_yellow=$(yq -r '.b_yellow' "$file" )
  b_blue=$(yq -r '.b_blue' "$file" )
  b_magenta=$(yq -r '.b_magenta' "$file" )
  b_cyan=$(yq -r '.b_cyan' "$file" )
  b_white=$(yq -r '.b_white' "$file" )

  l_black=$(yq -r '.l_black' "$file" )
  l_red=$(yq -r '.l_red' "$file" )
  l_green=$(yq -r '.l_green' "$file" )
  l_yellow=$(yq -r '.l_yellow' "$file" )
  l_blue=$(yq -r '.l_blue' "$file" )
  l_magenta=$(yq -r '.l_magenta' "$file" )
  l_cyan=$(yq -r '.l_cyan' "$file" )
  l_white=$(yq -r '.l_white' "$file" )

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