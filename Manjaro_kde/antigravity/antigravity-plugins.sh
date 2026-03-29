#!/bin/bash

OUTPUT_FILE="antigravity_plugins_backup.txt"
PLUGIN_DIR="$HOME/.antigravity/plugins"

echo "Plugin Backup - $(date)" > $OUTPUT_FILE
echo "------------------------" >> $OUTPUT_FILE

for plugin in $PLUGIN_DIR/*; do
    if [ -d "$plugin" ]; then
        name=$(basename "$plugin")

        if [ -f "$plugin/package.json" ]; then
            version=$(grep '"version"' "$plugin/package.json" | head -1 | cut -d '"' -f4)
        else
            version="unknown"
        fi

        echo "$name : $version" >> $OUTPUT_FILE
    fi
done

echo "Backup completed: $OUTPUT_FILE"