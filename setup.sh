#!/bin/bash
set -e

# check file existence and readability
check_file() {
  if [ ! -f "$1" ]; then
    echo "Error: $1 is not exists"
    exit 1
  fi
}

# apt update
sudo apt update -y
sudo apt upgrade -y

# apt package install
APT_PACKAGES_FILE="./packages/apt-packages.txt"
check_file "$APT_PACKAGES_FILE"
## loop read
while IFS= read -r package || [ -n "$package" ]; do
  # skip comment or blank line 
  [[ "$package" =~ ^#.*$ || -z "$package" ]] && continue
  sudo apt install -y "$package"
done < "$APT_PACKAGES_FILE"


# snap package install
SNAP_PACKAGES_FILE="./packages/snap-packages.txt"
check_file "$SNAP_PACKAGES_FILE"
## loop read
while IFS= read -r package || [ -n "$package" ]; do
  # skip comment or blank line 
  [[ "$package" =~ ^#.*$ || -z "$package" ]] && continue
  sudo snap install "$package"
done < "$SNAP_PACKAGES_FILE"

# run scripts
SCRIPTS_DIR="./scripts"
if [ -d "$SCRIPTS_DIR" ]; then
  
  for script in "$SCRIPTS_DIR"/*.sh; do
    if [ -f "$script" ]; then
      # +x
      [ ! -x "$script" ] && sudo chmod +x "$script"
      echo "executing: $script"
      "$script"
    fi
  done
else
  echo "Warning: $SCRIPTS_DIR directory is not exist"
fi

# rep update
sudo apt update -y

echo "SUCCESSFULLY INSTALLED!"

