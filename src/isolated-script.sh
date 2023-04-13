#!/usr/bin/env bash

readonly MRTESH_TEST_FILE="${1:?}"
readonly MRTESH_TEST_FUNCTION="${2:?}"
readonly MRTESH_TEST_DIR="$(realpath "${MRTESH_TEST_FILE}" | xargs dirname)"
readonly MRTESH_TEST_ENVIRONMENT="${MRTESH_TEST_DIR}/environment.sh"

source "${MRTESH_TEST_ENVIRONMENT}"
source "${MRTESH_TEST_FILE}"

${MRTESH_TEST_FUNCTION}
