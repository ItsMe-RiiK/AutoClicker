#!/bin/bash
# Move to the project directory no matter where this script is called from
cd "$(dirname "$0")"

KERNEL_DIR="RKKDR"
RELEASE_DIR="release"

# 1. Compile the GUI natively
make

# 2. Check and load the Kernel Module
if ! lsmod | grep -q RKKDR; then
    # If not loaded, compile and load it automatically
    make -C "$KERNEL_DIR" load
fi

# 3. Allow root to access the X11 display
xhost +si:localuser:root > /dev/null 2>&1

# 4. Launch the GUI
# The binary is located in the detected release folder
sudo -S -E "$RELEASE_DIR/AutoClicker" > gui_error.log 2>&1