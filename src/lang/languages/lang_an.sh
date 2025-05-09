#!/usr/bin/env bash

# this shit is only a meme ;D

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Saliendo con código: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} ¡No ha pasao na', qué tranquilo está todo!"
    [EXIT_1]="${PREFIX_ERROR} ¡Uy, has metío más de un parámetro, niño!"
    [EXIT_2]="${PREFIX_ERROR} ¡Vaya, el parámetro ese que has ponío no lleva ná!"
    [EXIT_3]="${PREFIX_ERROR} ¡Ojo, el argumento está vacíiiiiiiito!"
    [EXIT_4]="${PREFIX_ERROR} Te falta una dependecia: ${COLOR_W} yq, ¡ponla ya!"
    [EXIT_5]="${PREFIX_ERROR} Te falta otra dependencia: ${COLOR_W} taplo, ¿pero qué haces?"
    [EXIT_6]="${PREFIX_ERROR} ¡No hemos podío descargar el archivo! ¿Qué has hecho?"
    [EXIT_7]="${PREFIX_ERROR} ¡El archivo no existe, hombre! ¿Lo has perdíoooo?"
    [EXIT_8]="${PREFIX_ERROR} ¡No tienes permisos pa' leer el archivo, venga ya!"
    [EXIT_9]="${PREFIX_ERROR} ¡El archivo está vacío! ¿Qué has metío ahí?"
    [EXIT_10]="${PREFIX_ERROR} ¡No hemos detectao el formato del archivo, qué lío!"
    [EXIT_11]="${PREFIX_ERROR} ¡No tenemos lector pa' ese formato, chiquillo!"
    [EXIT_12]="${PREFIX_ERROR} ¡El archivo tiene valores faltantes, que está hecho un lío!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Estoy mirando los parámetros, tranquilo..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Voy a ver si tienes las dependencias, espérate..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Comprobando el argumento: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} ¡Argumentos comprobados, to' correcto!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Estoy pillando el archivo: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} ¡Archivo descargao, eso está hecho!"

    # --help 
    [manual_title]="${PREFIX_INFO} Aquí tienes el manualito, ya verás:"
    [manual_content]="
Color-Processor: ¡Una herramienta pa' gestionar los temas de colores, que está de lujo!

# Dependencias:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Uso:

  Color-Converter.sh [ayuda(s)] [proceso] | [proceso] [ayuda(s)] 

## Ayudas:

  ¤ [ -h | --help ]          : Pa' ver ESTE manualito.
  ¤ [ -d | --debug ]         : Pa' que te salga to' el rollo de depuración.
    
## Procesos:

  ¤ SHOW <archivo> [acción(es)] : Pa' MUESTRA la información del <archivo>.
  ¤ FILE <archivo> [acción(es)] : Pa' procesar el <archivo>.
    
### Acciones del proceso 'FILE':
  
  ¤ --get                     : Si el <archivo> es una URL, lo tienes que descargar.
  ¤ --rm                      : Pa' borrar el <archivo> después de procesarlo, ¡a la mierda!
  ¤ --install [formato(s)]    : Pa' instalar la paleta de colores en los formatos que elijas.
  ¤ --convert [formato(s)]    : Pa' convertir la paleta de colores a los formatos que digas.

### Acciones del proceso 'SHOW':
  
  ¤ --get                     : Si el <archivo> es una URL, lo tienes que descargar.
  ¤ --rm                      : Pa' borrar el <archivo> después de procesarlo.

## Formatos:

  ¤ --all                    : Pa' que lo haga con TODOS los formatos disponibles

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
    [verifying_file]="${PREFIX_VERIFICATOR} Estoy mirando el archivo: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Comprobando si el archivo está por ahí..."
      [file_exist]="${PREFIX_SUCCESS} ¡El archivo está ahí, chaval!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} A ver si puedes leer el archivo..."
      [file_access]="${PREFIX_SUCCESS} ¡Tienes permiso pa' leerlo!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Mirando si el archivo está vacío..."
      [file_not_empty]="${PREFIX_SUCCESS} ¡El archivo no está vacío, como debe ser!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Mirando los datos que tiene el archivo..."

    # Color printer :
    [colors_title]="${PREFIX_INFO} Aquí están los colores que hemos pillao:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Ejecuto el proceso: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Procesando el archivo: ${COLOR_W}"

      # baddies
      [skipping_file]="${PREFIX_FILE} Vamo a saltá er archivo... ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Voy a pasar todos los escáneres..."
    [executing_scanner]="${PREFIX_STEP} Escaneando con: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} ¡Formato detectao!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} ¡Escaneao con éxito!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Mirando el lector que vamos a usar: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Usando el lector: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Ejecutando los procesos sobre archivos..."

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} La ruta de salida está puesta en: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Oye, esa ruta no existe: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Creando el directorio: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Arrancando los convertidores..."
      [executing_conversor]="${PREFIX_STEP} Convirtiendo con: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} ¡No hay ná que convertir, chaval!"
      [file_converted]="${PREFIX_SUCCESS} ¡El archivo convertío con éxito!"
      [all_files_converted]="${PREFIX_SUCCESS} ¡Todos los archivos convertíos, perfecto!"

    [all_file_actions_executed]="${PREFIX_SUCCESS} ¡Ya está to' hecho!"
)
