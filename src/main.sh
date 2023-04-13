
function mrtesh_main_run() {
  mrtesh_main_parse_args "$@"
  mrtesh_main_init
  mrtesh_main_exec "${MRTESH_ARGS[@]}"
}

# private
function mrtesh_main_parse_args() {
  APPX_TESTS_DIR=""

  # args without options
  MRTESH_ARGS=()

  while :; do
    case ${1-} in

      --debug)
        if ! mrcore_debug_level_validate "${2-}" ; then
          echo "--debug value: 0 - 4"
          exit 1
        fi

        MRCORE_DEBUG_LEVEL="${2}"
        shift
        ;;

      -n | --no-color)
        MRCORE_USE_COLOR=false
        ;;

      -V | --verbose)
        MRCORE_VERBOSE=true
        ;;

      -v | --version)
        echo -e "${MRTESH_INFO_CAPTION} version ${MRTESH_INFO_VERSION}"
        exit 0
        ;;

      -d | --tests-dir)
        if [[ -z "${2-}" ]]; then
          echo "-d --tests-dir value: dir in $(realpath "${APPX_DIR}")/"
          exit 1
        fi

        APPX_TESTS_DIR="${2}"
        shift
        ;;

      *)
        if [[ -z "${1-}" ]]; then
          return
        fi

        MRTESH_ARGS+=("${1}")
        ;;
    esac

    shift
  done
}

# private
function mrtesh_main_init() {
  mrcore_colors_init
  mrcore_debug_init
  mrtesh_main_init_paths
}

# private
function mrtesh_main_init_paths() {
  mrcore_debug_echo ${DEBUG_LEVEL_2} "${DEBUG_GREEN}" "Current run path: $(realpath "${APPX_DIR}")"

  if [ -n "${APPX_TESTS_DIR}" ]; then
    APPX_TESTS_DIR="${APPX_DIR}/${APPX_TESTS_DIR}"
  else
    APPX_TESTS_DIR="${APPX_DIR}/tests"
  fi

  mrcore_validate_dir_required "${MRTESH_INFO_CAPTION} directory for tests" "${APPX_TESTS_DIR}"
}

# private
function mrtesh_main_exec {
  local currentCommand=${1-}

  if [ -z "${currentCommand}" ]; then
    mrtesh_test_exec "$@"
    exit 0
  fi

  shift

  case ${currentCommand} in

    help)
      mrtesh_${currentCommand}_exec
      exit 0
      ;;

  esac

  mrcore_echo_error "Command ${currentCommand} is unknown"
  mrcore_echo_sample "Run '${MRTESH_INFO_NAME} help' for usage"
}
