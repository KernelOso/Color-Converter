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

# Process

  # arg treatment
  PROCESS_TYPE=""
  PROCESS_ARG=""
  FILE_BASENAME=""

#flags triggers
FLAG_DEBUG=false
FLAG_HELP=false
FLAG_GET=false
FLAG_REMOVE=false



