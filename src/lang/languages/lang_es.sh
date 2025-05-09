#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Saliendo con código: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} ¡No ocurrieron errores!"
    [EXIT_1]="${PREFIX_ERROR} Se ingresó más de un parámetro de proceso"
    [EXIT_2]="${PREFIX_ERROR} Se ingresó un parámetro como argumento"
    [EXIT_3]="${PREFIX_ERROR} El argumento ingresado está vacío"
    [EXIT_4]="${PREFIX_ERROR} Dependencia faltante: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Dependencia faltante: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} No se pudo descargar el archivo"
    [EXIT_7]="${PREFIX_ERROR} ¡El archivo NO existe!"
    [EXIT_8]="${PREFIX_ERROR} ¡No tienes permisos de lectura sobre el archivo!"
    [EXIT_9]="${PREFIX_ERROR} ¡El archivo está vacío!"
    [EXIT_10]="${PREFIX_ERROR} ¡No se detectó el formato del archivo!"
    [EXIT_11]="${PREFIX_ERROR} ¡No existe un lector para el formato detectado!"
    [EXIT_12]="${PREFIX_ERROR} ¡El archivo tiene valores faltantes!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Verificando los parámetros..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Verificando dependencias..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Verificando el argumento: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} ¡Argumentos verificados!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Obteniendo el archivo: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} ¡El archivo se descargó correctamente!"

    # --help 
    [manual_title]="${PREFIX_INFO} Manual:"
    [manual_content]="
Color-Processor: ¡Una herramienta para gestionar temas de colores!

# Dependencias:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Uso:

  Color-Converter.sh [ayuda(s)] [proceso] | [proceso] [ayuda(s)] 

## Ayudas:

  ¤ [ -h | --help ]          : Muestra ESTE manual.
  ¤ [ -d | --debug ]         : Muestra los mensajes de depuración.
    
## Procesos:

  ¤ SHOW <archivo> [acción(es)] : Solo MUESTRA la información del <archivo>.
  ¤ FILE <archivo> [acción(es)] : Procesa el <archivo>.
    
### Acciones del proceso 'FILE':
  
  ¤ --get                     : Indica que el <archivo> ingresado es una URL 
                                y debe descargarse desde internet.
  ¤ --rm                      : Elimina el <archivo> después de procesarlo.
  ¤ --install [formato(s)]    : Instala la paleta de colores en los [formato(s)]
                                seleccionados.
  ¤ --convert [formato(s)]    : Convierte la paleta de colores a los [formato(s)]
                                seleccionados.

### Acciones del proceso 'SHOW':
  
  ¤ --get                     : Indica que el <archivo> ingresado es una URL 
                                y debe descargarse desde internet.
  ¤ --rm                      : Elimina el <archivo> después de procesarlo.

## Formatos:

  ¤ --all                    : Usa TODOS los formatos disponibles

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
    [verifying_file]="${PREFIX_VERIFICATOR} Verificando el archivo: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Verificando si el archivo existe..."
      [file_exist]="${PREFIX_SUCCESS} ¡El archivo existe!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Verificando si tienes permisos de lectura sobre el archivo..."
      [file_access]="${PREFIX_SUCCESS} ¡Tienes permisos de lectura!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Verificando si el archivo está vacío..."
      [file_not_empty]="${PREFIX_SUCCESS} ¡El archivo no está vacío!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Verificando los datos..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Colores:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Ejecutando el proceso: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Procesando el archivo: ${COLOR_W}"

      # baddies
      [skipping_file]="${PREFIX_FILE} Omitiendo archivo... ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Ejecutando escáneres..."
    [executing_scanner]="${PREFIX_STEP} Ejecutando escáner: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} ¡Formato detectado!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} ¡Escáneres ejecutados correctamente!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Verificando el lector: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Ejecutando el lector: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Ejecutando procesos sobre archivos: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Ruta de salida establecida en: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Ruta ingresada inexistente: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Creando el directorio: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Ejecutando convertidores... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Ejecutando conversor: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} ¡No hay formatos para convertir! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} ¡Archivo convertido!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} ¡Todos los archivos han sido convertidos! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} ¡Todos los procesos se ejecutaron correctamente! ${COLOR_W}"
)
