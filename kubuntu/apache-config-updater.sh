#!/bin/bash

# Paths to the configuration files
CONFIG_FILES=(
    "/etc/php/7.4/cli/php.ini"
    "/etc/php/7.4/apache2/php.ini"
    "/etc/php/7.4/fpm/php.ini"
    "/etc/php/8.1/cli/php.ini"
    "/etc/php/8.1/apache2/php.ini"
    "/etc/php/8.1/fpm/php.ini"
    "/etc/php/8.2/cli/php.ini"
    "/etc/php/8.2/apache2/php.ini"
    "/etc/php/8.2/fpm/php.ini"
)

# Values to modify or add
declare -A CONFIG_VALUES
CONFIG_VALUES=(
    [upload_max_filesize]="40M"
    [post_max_size]="48M"
    [memory_limit]="2G"
    [max_execution_time]="600"
    [max_input_vars]="3000"
    [max_input_time]="1000"
)

# Check if configuration files exist
check_files_exist() {
    for config_file in "${CONFIG_FILES[@]}"; do
        if [[ ! -f "$config_file" ]]; then
            echo "Error: File not found: $config_file"
            exit 1
        fi
    done
}

# Function to modify or add values in a file
update_config() {
    local file="$1"
    local key value

    for key in "${!CONFIG_VALUES[@]}"; do
        value="${CONFIG_VALUES[$key]}"

        if grep -q "^$key" "$file"; then
            # If the key exists, replace it
            sed -i "s/^$key.*/$key = $value/" "$file"
        else
            # If it does not exist, add it at the end
            echo "$key = $value" >> "$file"
        fi
    done
}

# Check if all configuration files exist
check_files_exist

# Iterate over the files and apply the changes
for config_file in "${CONFIG_FILES[@]}"; do
    echo "Modifying $config_file..."
    update_config "$config_file"
done

# Confirm completion
echo "Configuration updated."
