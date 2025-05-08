#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Sortint amb codi: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} No hi ha hagut cap error!"
    [EXIT_1]="${PREFIX_ERROR} S'ha introduït més d'un paràmetre de procés"
    [EXIT_2]="${PREFIX_ERROR} S'ha introduït un paràmetre com a argument"
    [EXIT_3]="${PREFIX_ERROR} L'argument introduït està buit"
    [EXIT_4]="${PREFIX_ERROR} Dependència manca: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Dependència manca: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} No s'ha pogut descarregar el fitxer"
    [EXIT_7]="${PREFIX_ERROR} El fitxer NO existeix!"
    [EXIT_8]="${PREFIX_ERROR} No tens permisos de lectura sobre el fitxer!"
    [EXIT_9]="${PREFIX_ERROR} El fitxer està buit!"
    [EXIT_10]="${PREFIX_ERROR} No s'ha detectat el format del fitxer!"
    [EXIT_11]="${PREFIX_ERROR} No existeix un lector per al format detectat!"
    [EXIT_12]="${PREFIX_ERROR} El fitxer té valors mancants!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Verificant els paràmetres..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Verificant les dependències..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Verificant l'argument: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} Arguments verificats!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Obtenint el fitxer: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} Fitxer descarregat correctament!"

    # --help 
    [manual_title]="${PREFIX_INFO} Manual:"
    [manual_content]="
Color-Processor: Eina per gestionar temes de colors!

# Dependències:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Ús:

  Color-Converter.sh [ajuda(s)] [procés] | [procés] [ajuda(s)] 

## Ajudes:

  ¤ [ -h | --help ]          : Mostra aquest manual.
  ¤ [ -d | --debug ]         : Mostra els missatges de depuració.
    
## Processos:

  ¤ SHOW <fitxer> [acció(s)] : Només MOSTRA la informació del <fitxer>.
  ¤ FILE <fitxer> [acció(s)] : Processa el <fitxer>.
    
### Accions del procés 'FILE':
  
  ¤ --get                     : Indica que el <fitxer> introduït és una URL 
                                i cal descarregar-lo des d'internet.
  ¤ --rm                      : Elimina el <fitxer> després de processar-lo.
  ¤ --install [format(s)]     : Instala la paleta de colors als [format(s)]
                                seleccionats.
  ¤ --convert [format(s)]     : Converteix la paleta de colors als [format(s)]
                                seleccionats.

### Accions del procés 'SHOW':
  
  ¤ --get                     : Indica que el <fitxer> introduït és una URL 
                                i cal descarregar-lo des d'internet.
  ¤ --rm                      : Elimina el <fitxer> després de processar-lo.

## Formats:

  ¤ --all                    : Utilitza TOTS els formats disponibles

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
    [verifying_file]="${PREFIX_VERIFICATOR} Verificant el fitxer: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Verificant si el fitxer existeix..."
      [file_exist]="${PREFIX_SUCCESS} El fitxer existeix!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Verificant si tens permisos de lectura sobre el fitxer..."
      [file_access]="${PREFIX_SUCCESS} Tens permisos de lectura!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Verificant si el fitxer està buit..."
      [file_not_empty]="${PREFIX_SUCCESS} El fitxer no està buit!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Verificant les dades..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Colors:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Executant el procés: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Processant el fitxer: ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Executant escàners..."
    [executing_scanner]="${PREFIX_STEP} Executant escàner: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Format detectat!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Escàners executats correctament!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Verificant el lector: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Executant el lector: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Executant processos sobre fitxers: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Ruta de sortida establerta a: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Ruta introduïda inexistent: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Creant el directori: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Executant convertidors... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Executant convertidor: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} No hi ha formats per convertir! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} Fitxer convertit!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} Tots els fitxers han estat convertits! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} Tots els processos s'han executat correctament! ${COLOR_W}"
)
