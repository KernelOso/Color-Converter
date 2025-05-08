#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Elirante kun kodo: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} Neniuj eraroj okazis!"
    [EXIT_1]="${PREFIX_ERROR} Eniris pli ol unu procesparametro"
    [EXIT_2]="${PREFIX_ERROR} Parametro eniris kiel argumento"
    [EXIT_3]="${PREFIX_ERROR} La enirita argumento estas malplena"
    [EXIT_4]="${PREFIX_ERROR} Mankas dependeco: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Mankas dependeco: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} Ne eblis elŝuti la dosieron"
    [EXIT_7]="${PREFIX_ERROR} La dosiero NE ekzistas!"
    [EXIT_8]="${PREFIX_ERROR} Vi ne havas legpermeson pri la dosiero!"
    [EXIT_9]="${PREFIX_ERROR} La dosiero estas malplena!"
    [EXIT_10]="${PREFIX_ERROR} La formato de la dosiero ne estis detektita!"
    [EXIT_11]="${PREFIX_ERROR} Ne ekzistas legilo por la detektita formato!"
    [EXIT_12]="${PREFIX_ERROR} La dosiero havas mankajn valorojn!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Kontrolante la parametrojn..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Kontrolante dependecojn..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Kontrolante la argumenton: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} Argumentoj kontrolitaj!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Elŝutante la dosieron: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} La dosiero estis sukcese elŝutita!"

    # --help 
    [manual_title]="${PREFIX_INFO} Manlibro:"
    [manual_content]="
Kolora-Provizanto: Ilo por administri koloremajn temojn!

# Dependecoj:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Uzado:

  Color-Converter.sh [helpo(j)] [proceso] | [proceso] [helpo(j)] 

## Helpoj:

  ¤ [ -h | --help ]          : Montras ĈI tiun manlibron.
  ¤ [ -d | --debug ]         : Montras depurajn mesaĝojn.
    
## Procesoj:

  ¤ SHOW <dosiero> [ago(j)] : Nur MONTRAS la informon de la <dosiero>.
  ¤ FILE <dosiero> [ago(j)] : Procesas la <dosiero>.
    
### Aĝoj de la 'FILE' proceso:
  
  ¤ --get                     : Indikas, ke la <dosiero> estas URL 
                                kaj ĝi devas esti elŝutita elrete.
  ¤ --rm                      : Forigas la <dosiero> post la prilaboro.
  ¤ --install [formato(j)]    : Instalas la kolorpaleton en la elektitaj [formato(j)].
  ¤ --convert [formato(j)]    : Konvertas la kolorpaleton al la elektitaj [formato(j)].

### Aĝoj de la 'SHOW' proceso:
  
  ¤ --get                     : Indikas, ke la <dosiero> estas URL 
                                kaj ĝi devas esti elŝutita elrete.
  ¤ --rm                      : Forigas la <dosiero> post la prilaboro.

## Formatoj:

  ¤ --all                    : Uzadas ĈIUN haveblan formaton

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
    [verifying_file]="${PREFIX_VERIFICATOR} Kontrolante la dosieron: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Kontrolante ĉu la dosiero ekzistas..."
      [file_exist]="${PREFIX_SUCCESS} La dosiero ekzistas!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Kontrolante ĉu vi havas legpermeson pri la dosiero..."
      [file_access]="${PREFIX_SUCCESS} Vi havas legpermeson!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Kontrolante ĉu la dosiero estas malplena..."
      [file_not_empty]="${PREFIX_SUCCESS} La dosiero ne estas malplena!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Kontrolante la datumojn..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Koloroj:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Ekzekutante la proceson: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Prilaborante la dosieron: ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Ekzekutante skanilojn..."
    [executing_scanner]="${PREFIX_STEP} Ekzekutante skanilon: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Formato detektita!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Skaniloj sukcesis ekzekuti!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Kontrolante la legilon: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Ekzekutante la legilon: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Ekzekutante dosierajn procesojn: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Eliraj vojoj starigitaj al: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Enirita vojo ne ekzistas: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Kreante la direktoron: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Ekzekutante konvertantojn... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Ekzekutante konvertanton: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} Neniu formatoj por konverti! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} Dosiero konvertita!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} Ĉiuj dosieroj estis konvertitaj! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} Ĉiuj procesoj estis ekzekutitaj sukcese! ${COLOR_W}"
)
