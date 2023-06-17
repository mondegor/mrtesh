#!/usr/bin/env bash
# chmod +x ./test.sh

readonly MRTESH_DIR=$(realpath "${BASH_SOURCE[0]}" | xargs dirname)
readonly APPX_DIR="."
readonly APPX_DIR_REAL=$(realpath "${APPX_DIR}")

source "${MRTESH_DIR}/src/core/bash.sh"
source "${MRTESH_DIR}/src/core/colors.sh"
source "${MRTESH_DIR}/src/core/debug.sh"
source "${MRTESH_DIR}/src/core/echo.sh"
source "${MRTESH_DIR}/src/core/lib.sh"
source "${MRTESH_DIR}/src/core/validate.sh"
source "${MRTESH_DIR}/src/core/xtrace.sh"
source "${MRTESH_DIR}/src/help.sh"
source "${MRTESH_DIR}/src/info.sh"
source "${MRTESH_DIR}/src/main.sh"
source "${MRTESH_DIR}/src/test.sh"

mrtesh_main_run "$@"
