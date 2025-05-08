#!/usr/bin/env bash

function verify_args () {

  for ref in "$@"; do

    declare -n arg="$ref"

    log_message "$(get_message "verifying_args") ${E_RESET}${arg}" "index" 2 "${COLOR_STEP}" true

    # Verify if arg is empty
    if 
      [[ 
        -z $arg
      ]]; 
    then
      log_message "$(get_message "EXIT_3")" "last" 3 "${COLOR_ERROR}" true
      exit_code 3
    fi

    #verify if the arg isn't a flag
    for item in "${EXISTING_FLAGS[@]}"; do
      if [[ "$arg" == "$item" ]]; then
          log_message "$(get_message "EXIT_2")" "last" 3 "${COLOR_ERROR}" true 1
          exit_code 2
      fi
    done

  done

  log_message "$(get_message "arguments_verified")" "last" 2 "${COLOR_SUCCESS}" true

}



function load_parameters () {

  log_message "$(get_message "reading_parameters")" "index" 1 "${COLOR_VERIFICATOR}" false
  
  local params=( "$@" )
  local processes_used=0
  local index=0
  local arg_position=0
  local arguments=()


  for param in "${params[@]}"; 
  do

    ((index++))

    case "$param" in 

      # Processes
      "FILE")
        PROCESS_TYPE="FILE"
        ((processes_used++))

        arg_position=$((index + 1))
        PROCESS_ARG="${!arg_position}"
        arguments+=("PROCESS_ARG")
        ;;
      "BADDIES")
        PROCESS_TYPE="BADDIES"
        ((processes_used++))

        arg_position=$((index + 1))
        PROCESS_ARG="${!arg_position}"
        arguments+=("PROCESS_ARG")
        ;;
      "SHOW")
        PROCESS_TYPE="SHOW"
        ((processes_used++))

        arg_position=$((index + 1))
        PROCESS_ARG="${!arg_position}"
        arguments+=("PROCESS_ARG")
        ;;
      
      # flags
      "--debug"|"-d")
        FLAG_DEBUG=true
        ;;
      "--help"|"-h")
        FLAG_HELP=true
        ;;
      "--get"|"-g")
        FLAG_GET=true
        ;;
      "--rm")
        FLAG_REMOVE=true
        ;;
      # FILE flags
      "--convert"|"-c")
        FLAG_CONVERT=true
        ;;
      "--install"|"-i")
        FLAG_INSTALL=true
        ;;
      # FILE flags
      "--outdir")
        FLAG_OUT_DIR=true

        # save argument
        arg_position=$((index + 1))
        OUT_DIR_ARG="${!arg_position}"
        arguments+=("OUT_DIR_ARG")
        ;;
      "--mkdir")
        FLAG_MKDIR=true
        ;;
      "--outname")
        FLAG_OUT_NAME=true

        # save argument
        arg_position=$((index + 1))
        OUT_BASENAME_ARG="${!arg_position}"
        arguments+=("OUT_BASENAME_ARG")
        ;;
      
      # formats
      "--all"|"-a")
        FLAG_ALL=true
        ;;
      "--kitty")
        if [[ ! $FORMAT_KITTY ]];then
          FLAG_FORMATS+=("kitty")
          FORMAT_KITTY=true
        fi
        ;;
      "--alacritty")
        if [[ ! $FORMAT_ALACRITTY ]];then
          FLAG_FORMATS+=("alacritty")
          FORMAT_ALACRITTY=true
        fi
        ;;
      "--oso")
        if [[ ! $FORMAT_OSO ]];then
          FLAG_FORMATS+=("oso")
          FORMAT_OSO=true
        fi
        ;;
      "--xresources")
        if [[ ! $FORMAT_XRESOURCES ]];then
          FLAG_FORMATS+=("xresources")
          FORMAT_XRESOURCES=true
        fi
        ;;
      "--termite")
        if [[ ! $FORMAT_TERMITE ]];then
          FLAG_FORMATS+=("termite")
          FORMAT_TERMITE=true
        fi
        ;;
      "--termux")
        if [[ ! $FORMAT_TERMUX ]];then
          FLAG_FORMATS+=("termux")
          FORMAT_TERMUX=true
        fi
        ;;
      "--linux")
        if [[ ! $FORMAT_LINUX ]];then
          FLAG_FORMATS+=("linux")
          FORMAT_LINUX=true
        fi
        ;;
    esac

  done

  # prevent double param
  if [[ "$processes_used" -gt 1 ]]; then
    log_message "$(get_message "EXIT_1")" "last" 2 "${COLOR_ERROR}" true
    exit_code 1
  fi

  verify_args "${arguments[@]}"

}