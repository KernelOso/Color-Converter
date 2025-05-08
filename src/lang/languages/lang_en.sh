#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Exiting with code: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} No errors occurred!"
    [EXIT_1]="${PREFIX_ERROR} More than one process parameter was provided"
    [EXIT_2]="${PREFIX_ERROR} A parameter was passed as an argument"
    [EXIT_3]="${PREFIX_ERROR} The provided argument is empty"
    [EXIT_4]="${PREFIX_ERROR} Missing dependency: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Missing dependency: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} Failed to download the file"
    [EXIT_7]="${PREFIX_ERROR} The file does NOT exist!"
    [EXIT_8]="${PREFIX_ERROR} You don’t have read permissions for the file!"
    [EXIT_9]="${PREFIX_ERROR} The file is empty!"
    [EXIT_10]="${PREFIX_ERROR} File format not recognized!"
    [EXIT_11]="${PREFIX_ERROR} No reader available for the detected format!"
    [EXIT_12]="${PREFIX_ERROR} The file contains missing values!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Checking parameters..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Checking dependencies..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Checking argument: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} Arguments verified!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Downloading file: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} File downloaded successfully!"

    # --help 
    [manual_title]="${PREFIX_INFO} Manual:"
    [manual_content]="
Color-Processor: A tool to manage color themes!

# Dependencies:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Usage:

  Color-Converter.sh [help_flag(s)] [process] | [process] [help_flag(s)] 

## Help flags:

  ¤ [ -h | --help ]          : Shows THIS manual.
  ¤ [ -d | --debug ]         : Displays debug messages.
    
## Processes:

  ¤ SHOW <file> [action(s)] : Only DISPLAYS the <file> info.
  ¤ FILE <file> [action(s)] : Processes the <file>.
    
### FILE process actions:
  
  ¤ --get                     : Indicates that the <file> is a URL and should be downloaded.
  ¤ --rm                      : Deletes the <file> after processing.
  ¤ --install [format(s)]     : Installs the color palette into the specified [format(s)].
  ¤ --convert [format(s)]     : Converts the color palette to the specified [format(s)].

### SHOW process actions:
  
  ¤ --get                     : Indicates that the <file> is a URL and should be downloaded.
  ¤ --rm                      : Deletes the <file> after processing.

## Formats:

  ¤ --all                    : Use ALL available formats

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
    [verifying_file]="${PREFIX_VERIFICATOR} Checking file: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Checking if file exists..."
      [file_exist]="${PREFIX_SUCCESS} File exists!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Checking read permissions..."
      [file_access]="${PREFIX_SUCCESS} You have read permissions!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Checking if file is empty..."
      [file_not_empty]="${PREFIX_SUCCESS} File is not empty!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Validating data..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Colors:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Running process: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Processing file: ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Running scanners..."
    [executing_scanner]="${PREFIX_STEP} Running scanner: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Format detected!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Scanners ran successfully!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Checking reader: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Running reader: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Performing file operations: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Output path set to: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Provided path does not exist: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Creating directory: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Running converters... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Running converter: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} No formats to convert! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} File converted!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} All files converted successfully! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} All file operations completed successfully! ${COLOR_W}"
)
