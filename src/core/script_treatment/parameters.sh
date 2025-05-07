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
      
      # formats
      "--all"|"-a")
        FLAG_ALL=true
        ;;
      "--kitty")
        FLAG_FORMATS+=("kitty")
        ;;
      "--alacritty")
        FLAG_FORMATS+=("alacritty")
        ;;
      "--oso")
        FLAG_FORMATS+=("oso")
        ;;
      "--xresources")
        FLAG_FORMATS+=("xresources")
        ;;
      "--termite")
        FLAG_FORMATS+=("termite")
        ;;
      "--termux")
        FLAG_FORMATS+=("termux")
        ;;
      "--linux")
        FLAG_FORMATS+=("linux")
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