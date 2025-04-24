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
  background=$(taplo get -f $1 'colors.primary.background' | sed 's/^#//')
  foreground=$(taplo get -f $1 'colors.primary.foreground' | sed 's/^#//')

  cursor=$(taplo get -f $1 'colors.cursor.cursor' | sed 's/^#//')

  b_black=$(taplo get -f $1 'colors.normal.black' | sed 's/^#//')
  l_black=$(taplo get -f $1 'colors.bright.black' | sed 's/^#//')

  b_red=$(taplo get -f $1 'colors.normal.red' | sed 's/^#//')
  l_red=$(taplo get -f $1 'colors.bright.red' | sed 's/^#//')

  b_green=$(taplo get -f $1 'colors.normal.green' | sed 's/^#//')
  l_green=$(taplo get -f $1 'colors.bright.green' | sed 's/^#//')

  b_yellow=$(taplo get -f $1 'colors.normal.yellow' | sed 's/^#//')
  l_yellow=$(taplo get -f $1 'colors.bright.yellow' | sed 's/^#//')

  b_blue=$(taplo get -f $1 'colors.normal.blue' | sed 's/^#//')
  l_blue=$(taplo get -f $1 'colors.bright.blue' | sed 's/^#//')

  b_magenta=$(taplo get -f $1 'colors.normal.magenta' | sed 's/^#//')
  l_magenta=$(taplo get -f $1 'colors.bright.magenta' | sed 's/^#//')

  b_cyan=$(taplo get -f $1 'colors.normal.cyan' | sed 's/^#//')
  l_cyan=$(taplo get -f $1 'colors.bright.cyan' | sed 's/^#//')

  b_white=$(taplo get -f $1 'colors.normal.white' | sed 's/^#//')
  l_white=$(taplo get -f $1 'colors.bright.white' | sed 's/^#//')

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