#!/bin/bash

install() {
    if ! [ -f /opt/cursor.appimage ]; then
        echo "Installing Cursor..."

        CURSOR_URL="https://downloader.cursor.sh/linux/appImage/x64"
        ICON_URL="https://raw.githubusercontent.com/er-nabin-bhusal/cursor-install/main/64.png"

        APPIMAGE_PATH="/opt/cursor.appimage"
        ICON_PATH="/opt/cursor.png"
        DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

        # Install curl if not installed
        if ! command -v curl &> /dev/null; then
            echo "Installing curl..."
            sudo apt-get update
            sudo apt-get install -y curl
        fi

        echo "Downloading Cursor AppImage..."
        sudo curl -L $CURSOR_URL -o $APPIMAGE_PATH
        sudo chmod +x $APPIMAGE_PATH

        echo "Downloading Cursor icon..."
        sudo curl -L $ICON_URL -o $ICON_PATH

        echo "Creating .desktop entry for Cursor..."
        sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Cursor AI IDE
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL

        echo "Cursor installation complete. Find it in your application menu."
    else
        echo "Cursor is already installed."
    fi
}

install

