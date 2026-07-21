#!/bin/bash
# Move to the project root
cd "$(dirname "$0")/.."

echo "Uninstalling AutoClicker from your user profile..."

INSTALL_DIR="$HOME/.local/share/AutoClicker"
DESKTOP_FILE="$HOME/.local/share/applications/autoclicker.desktop"

if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo "Removed $INSTALL_DIR"
else
    echo "AutoClicker is not installed in $INSTALL_DIR."
fi

if [ -f "$DESKTOP_FILE" ]; then
    rm -f "$DESKTOP_FILE"
    echo "Removed desktop shortcut $DESKTOP_FILE"
fi

echo "✅ Uninstallation complete!"
