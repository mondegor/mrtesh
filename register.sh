#!/usr/bin/env bash
# chmod +x ./register.sh
# Registration of Mrtesh Tool for Linux

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

MRTESH_PATH="$(realpath "${BASH_SOURCE[0]}" | xargs dirname)/cmd.sh"
MRTESH_PATH_BIN=/usr/local/bin/mrcmd

if echo -e "#!/usr/bin/env bash\n${MRTESH_PATH} \"\$@\"" > "${MRTESH_PATH_BIN}"; then
  chmod +x "${MRTESH_PATH_BIN}"
  echo "Mrtesh Tool has been successfully registered in ${MRTESH_PATH_BIN}"
fi
