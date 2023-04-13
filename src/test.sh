
function mrtesh_test_exec() {
  mrcore_debug_echo_call_function "${FUNCNAME[0]}"

  local i=0
  local totalCount=0
  local testsCount=0
  local failuresCount=0
  local assertionsCount=0
  local testFilePath

  testBgColor=${CC_BG_GREEN}

  mrtesh_help_exec_head

  echo -e "${CC_YELLOW}Tests${CC_END} in ${CC_BLUE}${APPX_TESTS_DIR}${CC_END}\n"

  for testFilePath in "${APPX_TESTS_DIR}"/*
  do
    if [ -d "${testFilePath}" ]; then
      mrcore_debug_echo ${DEBUG_LEVEL_3} "${DEBUG_BLUE}" "Dir ${testFilePath} ignored"
      continue
    fi

    if ! mrcore_lib_check_string_suffix "${testFilePath}" "test.sh" ; then
      mrcore_debug_echo ${DEBUG_LEVEL_3} "${DEBUG_BLUE}" "File ${testFilePath} ignored"
      continue
    fi

    mrtesh_test_parse_functions "${testFilePath}"

    i=$((i + 1))
    totalCount=$((totalCount + 1))

    echo -en "${i}. ${CC_BLUE}${testFilePath}${CC_END}"

    if [ "${#MRTESH_RESULT_FUNCTIONS[@]}" -eq 0 ]; then
      assertionsCount=$((assertionsCount + 1))
      echo -e " [${CC_YELLOW}tests not found${CC_END}]"
      continue
    fi

    echo -e " (${#MRTESH_RESULT_FUNCTIONS[@]})\n"

    local testFuncName
    local j=0

    for testFuncName in "${MRTESH_RESULT_FUNCTIONS[@]}"
    do
      mrcore_debug_echo ${DEBUG_LEVEL_1} "${DEBUG_YELLOW}" "Call function: ${testFuncName}()"

      j=$((j + 1))
      testsCount=$((testsCount + 1))

      echo -en "  ${i}.${j}. ${testFuncName}() "

      if bash "${MRTESH_DIR}/src/isolated-script.sh" "${testFilePath}" "${testFuncName}" ; then
        echo -e "[${CC_GREEN}OK${CC_END}]"
        continue
      fi

      failuresCount=$((failuresCount + 1))
      echo -e "[${CC_RED}FAILED${CC_END}]"
    done

    echo ""
  done

  if [[ "${failuresCount}" -gt 0 ]]; then
    testBgColor="${CC_BG_RED}"
  elif [[ "${totalCount}" -eq 0 ]] || [[ "${assertionsCount}" -gt 0 ]]; then
    testBgColor="${CC_BG_YELLOW}"
  fi

  mrcore_echo_message "${testBgColor}" "Files: ${totalCount}, Assertions: ${assertionsCount}, Tests: ${testsCount}, Failures: ${failuresCount}."
}

function mrtesh_test_parse_functions() {
  mrcore_debug_echo ${DEBUG_LEVEL_2} "${DEBUG_GREEN}" "Extracting functions from file ${testFilePath} ..."

  local filePath="${1:?}"
  local pattern="^function [a-zA-Z_][a-zA-Z_0-9]*_test\(\) \{$"

  MRTESH_RESULT_FUNCTIONS=()

  while read -r line; do
    if [[ "${line}" =~ ${pattern} ]]; then
      line=${line:9:-4}
      MRTESH_RESULT_FUNCTIONS+=("$line")
    fi
  done < "${filePath}"
}
