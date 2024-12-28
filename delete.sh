#!/bin/bash

APPIMAGE_PATH="/opt/cursor.appimage"
ICON_PATH="/opt/cursor.png"
DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

if [ -f $APPIMAGE_PATH ]; then
    echo "Removing Cursor AI IDE..."
    sudo rm $APPIMAGE_PATH
    sudo rm $ICON_PATH
    sudo rm $DESKTOP_ENTRY_PATH
    echo "Cursor AI IDE removed."
else
    echo "Cursor AI IDE is not installed."
fi
