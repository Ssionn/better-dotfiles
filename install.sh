#!/bin/bash

echo "Setting up Neovim configuration..."

NVIM_CONFIG_DIR="$HOME/.config/nvim"
DOTFILES_DIR="$HOME/Documents/neo-config/nvim"

if ! command -v node >/dev/null 2>&1; then
    echo "Node.js is required but not installed. Installing Node.js..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        brew install node
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Ubuntu/Debian
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    else
        echo "Unsupported operating system. Please install Node.js manually."
        exit 1
    fi
fi

declare -a dependencies=("git" "npm" "unzip" "gcc" "ripgrep")

echo "Checking required dependencies..."
for dep in "${dependencies[@]}"; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        echo "$dep is required but not installed. Installing..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install "$dep"
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt-get install -y "$dep"
        else
            echo "Unsupported operating system. Please install $dep manually."
            exit 1
        fi
    fi
done

echo "Setting up symbolic links..."
if [ -d "$NVIM_CONFIG_DIR" ] || [ -L "$NVIM_CONFIG_DIR" ]; then
    echo "Removing existing nvim config directory/link..."
    rm -rf "$NVIM_CONFIG_DIR"
fi
echo "Creating symbolic link for nvim config..."
ln -s "$DOTFILES_DIR" "$NVIM_CONFIG_DIR"

if command -v php >/dev/null 2>&1; then
    echo "Installing PHP dependencies..."
    
    if ! command -v composer >/dev/null 2>&1; then
        echo "Installing Composer..."
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        php composer-setup.php --install-dir=/usr/local/bin --filename=composer
        php -r "unlink('composer-setup.php');"
    fi
    
    composer global require friendsofphp/php-cs-fixer
fi

if ! command -v prettier >/dev/null 2>&1; then
    echo "Installing Prettier..."
    npm install -g prettier
fi

echo "Installation complete!"
echo "Symbolic link created: $NVIM_CONFIG_DIR -> $DOTFILES_DIR"
echo "Next steps:"
echo "1. Open Neovim and wait for lazy.nvim to install plugins"
echo "2. Run :MasonInstall to install language servers"
echo "3. Run :TSInstall to install treesitter parsers"
echo "Recommended Mason packages to install:"
echo "- lua_ls"
echo "- intelephense"
echo "- eslint"
echo "- html"
echo "- jsonls"
echo "- prettier"
echo "- stylua"
