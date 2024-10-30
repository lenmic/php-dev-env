#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed."

    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if PHP is installed
if ! command -v php &> /dev/null
then
    echo "PHP is not installed."

    echo "Installing PHP..."
    brew install php
    php --version
fi

# Check if Git is installed
if ! command -v git &> /dev/null
then
    echo "Git is not installed."
    echo "Installing Git..."
    brew install git
    # Configure Git username and email
    # Read git name and email from user
    echo "Enter your Git username: "
    read git_username
    echo "Enter your Git email: "
    read git_email
    # Set Git username and email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
fi

# Check if Composer is installed
if ! command -v composer &> /dev/null
then
    echo "Composer is not installed."
    echo "Installing composer..."

    # Download Composer installation script
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"

    # Move Composer to bin directory
    cp composer.phar /usr/local/bin/composer

    # Create vendor/bin directory if it does not exist
    # mkdir -p vendor/bin

    # Move Composer to bin directory
    # mv composer.phar vendor/bin/composer
fi

# Check if Composer is installed
if ! command -v composer &> /dev/null
then
    echo "Composer is not installed. Please install Composer to proceed."
    exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker to proceed."
    exit 1
fi

# Install composer dependencies
# composer install


