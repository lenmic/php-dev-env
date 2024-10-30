#!/bin/bash

echo "Setting up general PHP project..."

# Check if Composer is installed
if ! command -v composer &> /dev/null
then
    echo "Composer is not installed."
    echo "Setting up basic dev env..."

    # Download the script dev-env.sh and execute it
    curl -s 'https://raw.githubusercontent.com/lenmic/php-dev-env/refs/heads/main/macos/dev-env.sh' | bash

    # Move Composer to bin directory
    cp composer.phar /usr/local/bin/composer
fi

# Create vendor/bin directory if it does not exist
mkdir -p vendor/bin

# Move Composer to bin directory
cp composer.phar vendor/bin/composer

echo "Create composer.json file..."
# Create composer.json file
composer init

# Install composer dependencies
composer install

echo "Project setup complete."
