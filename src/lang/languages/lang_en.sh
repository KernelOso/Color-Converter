#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Exiting with code: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} No errors occurred!"
    [EXIT_1]="${PREFIX_ERROR} More than one process parameter was entered"
    [EXIT_2]="${PREFIX_ERROR} A parameter was entered as an argument"
    [EXIT_3]="${PREFIX_ERROR} The entered argument is empty"
    [EXIT_4]="${PREFIX_ERROR} Missing dependency: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Missing dependency: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} Failed to download the file"
    [EXIT_7]="${PREFIX_ERROR} File does NOT exist!"
    [EXIT_8]="${PREFIX_ERROR} You don't have read permissions for the file!"
    [EXIT_9]="${PREFIX_ERROR} The file is empty!"
    [EXIT_10]="${PREFIX_ERROR} File format not detected!"
    [EXIT_11]="${PREFIX_ERROR} No reader available for the detected format!"
    [EXIT_12]="${PREFIX_ERROR} The file contains missing values!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Verifying parameters..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Verifying dependencies..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Verifying argument:"
    [arguments_verified]="${PREFIX_SUCCESS} Arguments verified!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Fetching file: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} File downloaded successfully!"

    # --help 
    [manual_title]="${PREFIX_INFO} Manual:"
    [manual_content]="
Color-Processor: A tool for managing color themes!

# Dependencies:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Usage:

  Color-Converter.sh [help(s)] [process] | [process] [help(s)]

## Help options:

  ¤ [ -h | --help ]          :   Shows THIS manual.
  ¤ [ -d | --debug ]         :   Displays debug messages.

## Processes:

  ¤ SHOW <file> [action(s)]  : Only DISPLAYS the information in <file>.
  ¤ FILE <file> [action(s)]  : Processes the <file>.

### FILE process actions:

  ¤ --get                    : Indicates that the input <file> is a URL,
                               and must be fetched from the internet.
  ¤ --rm                     : Deletes the <file> after processing.
  ¤ --install [format(s)]    : Installs the color palette in the selected [format(s)].
  ¤ --convert [format(s)]    : Converts the color palette to the selected [format(s)].

### SHOW process actions:

  ¤ --get                    : Indicates that the input <file> is a URL,
                               and must be fetched from the internet.
  ¤ --rm                     : Deletes the <file> after processing.

## Formats:

  ¤ --all                   : Uses ALL available formats

  ╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
  ║ Format Name    ║ Format Param   ║ Input Support? ║ Install Supp?  ║ Convert Supp?  ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Gogh           ║ NULL           ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Oso's Base16   ║ --oso          ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Base16         ║ NULL           ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ XResources     ║ --xresources   ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Kitty .conf    ║ --kitty        ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Alacritty.toml ║ --alacritty    ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Termite        ║ --termite      ║ NO             ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Termux         ║ --termux       ║ NO             ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Linux TTY      ║ --linuxtty     ║ NO             ║ NO             ║ NO             ║
  ╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝
  "

  # Data helpers

    # file verifier :
    [verifying_file]="${PREFIX_VERIFICATOR} Verifying file:${COLOR_W}"

      #Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Checking if file exists..."
      [file_exist]="${PREFIX_SUCCESS} File exists!"

      #Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Checking if you have read permissions for the file..."
      [file_access]="${PREFIX_SUCCESS} You have read permissions!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Checking if file is empty..."
      [file_not_empty]="${PREFIX_SUCCESS} File is not empty!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Verifying data..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Colors:"


  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Executing process:${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Processing file:${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Running scanners..."
    [executing_scanner]="${PREFIX_STEP} Running scanner:${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Format detected!:${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Scanners ran successfully!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Verifying reader:${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Running reader:${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Executing proccesses over files ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Running converters...${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Executing conversor :${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} There's no formats to convert!${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} File converted! :${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} All files converted!${COLOR_W}"
    
    [all_file_actions_executed]="${PREFIX_SUCCESS} All file process executed! ${COLOR_W}"

)
