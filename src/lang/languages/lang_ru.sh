#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Выход с кодом: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} Ошибок не обнаружено!"
    [EXIT_1]="${PREFIX_ERROR} Введено более одного параметра процесса"
    [EXIT_2]="${PREFIX_ERROR} Один из параметров передан как аргумент"
    [EXIT_3]="${PREFIX_ERROR} Аргумент пустой"
    [EXIT_4]="${PREFIX_ERROR} Отсутствует зависимость: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Отсутствует зависимость: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} Не удалось загрузить файл"
    [EXIT_7]="${PREFIX_ERROR} Файл не найден!"
    [EXIT_8]="${PREFIX_ERROR} Нет прав на чтение файла!"
    [EXIT_9]="${PREFIX_ERROR} Файл пустой!"
    [EXIT_10]="${PREFIX_ERROR} Не удалось определить формат файла!"
    [EXIT_11]="${PREFIX_ERROR} Нет обработчика для определённого формата!"
    [EXIT_12]="${PREFIX_ERROR} В файле отсутствуют необходимые данные!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Проверка параметров..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Проверка зависимостей..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Проверка аргумента: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} Аргументы успешно проверены!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Получение файла: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} Файл успешно загружен!"

    # --help 
    [manual_title]="${PREFIX_INFO} Руководство:"
    [manual_content]="
Color-Processor: Утилита для управления цветовыми схемами!

# Зависимости:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Использование:

  Color-Converter.sh [помощь] [процесс] | [процесс] [помощь]

## Помощь:

  ¤ [ -h | --help ]          : Показать ЭТО руководство.
  ¤ [ -d | --debug ]         : Включить вывод отладочной информации.
    
## Процессы:

  ¤ SHOW <файл> [действия]   : Просто ПОКАЗЫВАЕТ информацию о <файле>.
  ¤ FILE <файл> [действия]   : Обрабатывает <файл>.
    
### Действия процесса 'FILE':
  
  ¤ --get                    : Указывает, что <файл> — это URL, 
                               и его нужно загрузить из интернета.
  ¤ --rm                     : Удаляет <файл> после обработки.
  ¤ --install [формат(ы)]    : Устанавливает цветовую схему в выбранные [формат(ы)].
  ¤ --convert [формат(ы)]    : Конвертирует цветовую схему в выбранные [формат(ы)].

### Действия процесса 'SHOW':
  
  ¤ --get                    : Указывает, что <файл> — это URL, 
                               и его нужно загрузить из интернета.
  ¤ --rm                     : Удаляет <файл> после обработки.

## Форматы:

  ¤ --all                    : Использовать ВСЕ доступные форматы

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
    [verifying_file]="${PREFIX_VERIFICATOR} Проверка файла: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Проверяем, существует ли файл..."
      [file_exist]="${PREFIX_SUCCESS} Файл найден!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Проверка прав доступа к файлу..."
      [file_access]="${PREFIX_SUCCESS} Доступ к файлу есть!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Проверка, пуст ли файл..."
      [file_not_empty]="${PREFIX_SUCCESS} Файл не пустой!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Проверка данных..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Цвета:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Выполняется процесс: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Обработка файла: ${COLOR_W}"

      # baddies
      [skipping_file]="${PREFIX_FILE} Пропускаю файл... ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Запуск сканеров..."
    [executing_scanner]="${PREFIX_STEP} Запуск сканера: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Обнаружен формат: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Сканеры успешно завершены!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Проверка считывателя: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Запуск считывателя: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Обработка файла: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Путь вывода установлен на: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Указанный путь не существует: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Создание директории: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Запуск конвертеров... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Запуск конвертера: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} Нет доступных форматов для конвертации! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} Файл конвертирован!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} Все файлы успешно конвертированы! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} Все операции с файлами выполнены! ${COLOR_W}"
)
