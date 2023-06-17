
function mrtesh_help_exec() {
  mrcore_debug_echo_call_function "${FUNCNAME[0]}"

  mrtesh_help_exec_head

  #markup:"--|-|---------|-------|-------|---------------------------------------|"
  echo -e "${CC_GREEN}${MRTESH_INFO_CAPTION}${CC_END} is a tool for testing Mrcmd bash scripts."
  echo ""
  echo -e "${CC_YELLOW}Usage:${CC_END}"
  echo -e "  [${CC_BLUE}options${CC_END}] <${CC_GREEN}COMMAND${CC_END}> [arguments]"
  echo ""
  echo -e "${CC_YELLOW}Miscellaneous:${CC_END}"
  echo -e "  ${CC_BLUE}-d, --tests-dir${CC_END}  Set tests dir for testing"
  echo -e "  ${CC_BLUE}    --debug${CC_END} ${CC_CYAN}LEVEL${CC_END}        Enable debugging mode"
  echo -e "                           ${CC_CYAN}LEVEL${CC_END} is 1, 2, 3, or 4"
  echo -e "  ${CC_BLUE}-n, --no-color${CC_END}           Produce monochrome output"
  echo -e "  ${CC_BLUE}-V, --verbose${CC_END}            Explain what is being done"
  echo -e "  ${CC_BLUE}-v, --version${CC_END}            Display version information and exit"
  echo ""
}

function mrtesh_help_exec_head() {
  echo -e " ${CC_YELLOW} __  __   ___  ${CC_RED} _____   ___   ___   _  _ ${CC_END}"
  echo -e " ${CC_YELLOW}|  \/  | | _ \ ${CC_RED}|_   _| | __| / __| | || |${CC_END}"
  echo -e " ${CC_YELLOW}| |\/| | |   / ${CC_RED}  | |   | _|  \__ \ | __ |${CC_END}"
  echo -e " ${CC_YELLOW}|_|  |_| |_|_\ ${CC_RED}  |_|   |___| |___/ |_||_|${CC_END}"
  echo -e "                               ${CC_YELLOW}ver. ${MRTESH_INFO_VERSION}${CC_END}"
  echo ""
}
