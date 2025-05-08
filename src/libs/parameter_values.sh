#!/usr/bin/env bash

# this one is used to verify if the arg ingresed in a parameter \
# is one of the existing parameters
EXISTING_FLAGS=(
  "--debug" 
  "-d"
  "--help"
  "-h"
  "--rm"
)

PROCESS_TYPE=""
# ARGUMENTS

  PROCESS_ARG=""
  FILE_BASENAME=""

  OUT_DIR_ARG=""
  OUT_BASENAME_ARG=""

#flags triggers
FLAG_DEBUG=false
FLAG_HELP=false
FLAG_GET=false
FLAG_REMOVE=false

# FILE process flags
FLAG_CONVERT=false
FLAG_INSTALL=false

FLAG_OUT_DIR=false
FLAG_MKDIR=false

FLAG_OUT_NAME=false

# formats flags
FLAG_ALL=false
FLAG_FORMATS=()

# format triggers (prevent format duplicate in list)
FORMAT_KITTY=false
FORMAT_ALACRITTY=false
FORMAT_OSO=false
FORMAT_XRESOURCES=false
FORMAT_TERMITE=false
FORMAT_TERMUX=false
FORMAT_LINUX=false