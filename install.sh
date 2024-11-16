#!/bin/bash

echo "Setting up CoC for Neovim..."

NVIM_CONFIG_DIR="$HOME/.config/nvim"
DOTFILES_DIR="$HOME/Documents/neo-config/nvim"

# Check if Node.js is installed
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

# Check if npm is installed
if ! command -v npm >/dev/null 2>&1; then
    echo "npm is required but not installed. Please install npm."
    exit 1
fi

# Create symbolic link for Neovim config
echo "Setting up symbolic links..."
if [ -d "$NVIM_CONFIG_DIR" ] || [ -L "$NVIM_CONFIG_DIR" ]; then
    echo "Removing existing nvim config directory/link..."
    rm -rf "$NVIM_CONFIG_DIR"
fi
echo "Creating symbolic link for nvim config..."
ln -s "$DOTFILES_DIR" "$NVIM_CONFIG_DIR"

# Navigate to CoC directory and build
COC_DIR="$HOME/.local/share/nvim/lazy/coc.nvim"
if [ -d "$COC_DIR" ]; then
    echo "Building CoC..."
    cd "$COC_DIR" && npm ci && npm run build
    
    if [ $? -eq 0 ]; then
        echo "CoC successfully built!"
    else
        echo "Error building CoC. Please check the error messages above."
        exit 1
    fi
else
    echo "CoC directory not found at $COC_DIR"
    echo "Make sure you have CoC installed via your plugin manager first."
    exit 1
fi

echo "Installation complete!"
echo "Symbolic link created: $NVIM_CONFIG_DIR -> $DOTFILES_DIR"
echo "Don't forget to install language servers using :CocInstall"
echo "Example: :CocInstall coc-json coc-tsserver coc-pyright"
