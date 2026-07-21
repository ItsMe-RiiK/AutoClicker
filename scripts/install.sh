#!/bin/bash
# Move to the project root
cd "$(dirname "$0")/.."

echo "Installing AutoClicker to your user profile..."

# 1. Pre-check: Ensure RKKDR driver is loaded
if ! lsmod | grep -q RKKDR; then
    echo "❌ Error: RKKDR kernel driver is not loaded!"
    echo "Please ensure the RKKDR kernel module is loaded before installing."
    echo "You can load it by running ./launcher.sh once from this folder."
    exit 1
fi

# 2. Compile the app natively
echo "Compiling AutoClicker..."
make || { echo "❌ Build failed"; exit 1; }

# 3. Create the installation directories
INSTALL_DIR="$HOME/.local/share/AutoClicker"
APPS_DIR="$HOME/.local/share/applications"

mkdir -p "$INSTALL_DIR"
mkdir -p "$APPS_DIR"

# 4. Copy the necessary files
echo "Copying files to $INSTALL_DIR..."
cp release/AutoClicker "$INSTALL_DIR/"
cp launcher.sh "$INSTALL_DIR/"
cp image/AutoClick.png "$INSTALL_DIR/"

# 5. Generate the Desktop Entry (.desktop file)
DESKTOP_FILE="$APPS_DIR/autoclicker.desktop"
echo "Creating desktop shortcut at $DESKTOP_FILE..."

cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Type=Application
Name=AutoClicker
Comment=Hardware-level AutoClicker GUI
Exec=$INSTALL_DIR/launcher.sh
Icon=$INSTALL_DIR/AutoClick.png
Terminal=false
Categories=Utility;
EOF

chmod +x "$DESKTOP_FILE"

echo "✅ AutoClicker successfully installed!"
echo "You can now launch it directly from your desktop or application menu."
