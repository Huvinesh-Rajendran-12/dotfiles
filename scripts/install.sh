#!/bin/bash

# Cross-platform dotfiles installer for macOS and Linux
# This script sets up ghostty, starship, neovim, opencode, and zsh configurations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
else
    echo -e "${RED}Unsupported OS: $OSTYPE${NC}"
    exit 1
fi

echo -e "${BLUE}Detected OS: $OS${NC}"

# Function to backup existing config
backup_config() {
    local config_path="$1"
    local backup_path="${config_path}.backup.$(date +%Y%m%d_%H%M%S)"

    if [[ -e "$config_path" ]]; then
        echo -e "${YELLOW}Backing up $config_path to $backup_path${NC}"
        mv "$config_path" "$backup_path"
    fi
}

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        echo -e "${YELLOW}Removing existing symlink: $target${NC}"
        rm "$target"
    fi

    echo -e "${GREEN}Creating symlink: $target -> $source${NC}"
    ln -sf "$source" "$target"
}

# Get the absolute path of the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo -e "${BLUE}Dotfiles directory: $DOTFILES_DIR${NC}"

# Create necessary directories
echo -e "${BLUE}Creating config directories...${NC}"
mkdir -p ~/.config

# Setup Ghostty
if [[ -f "$DOTFILES_DIR/ghostty/config" ]]; then
    echo -e "${BLUE}Setting up Ghostty...${NC}"
    backup_config ~/.config/ghostty/config
    mkdir -p ~/.config/ghostty/themes
    create_symlink "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config

    # Copy themes
    for theme in "$DOTFILES_DIR/ghostty/themes"/*; do
        if [[ -f "$theme" ]]; then
            theme_name=$(basename "$theme")
            create_symlink "$theme" ~/.config/ghostty/themes/"$theme_name"
        fi
    done
fi

# Setup Starship
if [[ -f "$DOTFILES_DIR/starship/starship.toml" ]]; then
    echo -e "${BLUE}Setting up Starship...${NC}"
    backup_config ~/.config/starship.toml
    create_symlink "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml
fi

# Setup Neovim
if [[ -f "$DOTFILES_DIR/nvim/init.lua" ]]; then
    echo -e "${BLUE}Setting up Neovim...${NC}"
    backup_config ~/.config/nvim/init.lua
    mkdir -p ~/.config/nvim
    create_symlink "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
fi

# Setup OpenCode
if [[ -f "$DOTFILES_DIR/opencode/package.json" ]]; then
    echo -e "${BLUE}Setting up OpenCode...${NC}"
    backup_config ~/.config/opencode/package.json
    mkdir -p ~/.config/opencode
    create_symlink "$DOTFILES_DIR/opencode/package.json" ~/.config/opencode/package.json
fi

if [[ -f "$DOTFILES_DIR/opencode/CLAUDE.md" ]]; then
    backup_config ~/.claude/CLAUDE.md
    mkdir -p ~/.claude
    create_symlink "$DOTFILES_DIR/opencode/CLAUDE.md" ~/.claude/CLAUDE.md
fi

# Setup Zsh
if [[ -f "$DOTFILES_DIR/zshrc" ]]; then
    echo -e "${BLUE}Setting up Zsh...${NC}"
    backup_config ~/.zshrc
    create_symlink "$DOTFILES_DIR/zshrc" ~/.zshrc
fi

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}Note: You may need to restart your terminal applications for changes to take effect.${NC}"

# OS-specific instructions
if [[ "$OS" == "macos" ]]; then
    echo -e "${BLUE}macOS specific notes:${NC}"
    echo -e "  - Ghostty: Install via Homebrew: brew install ghostty"
    echo -e "  - Starship: Install via Homebrew: brew install starship"
    echo -e "  - Neovim: Install via Homebrew: brew install neovim"
    echo -e "  - Zsh: Install via Homebrew: brew install zsh"
elif [[ "$OS" == "linux" ]]; then
    echo -e "${BLUE}Linux specific notes:${NC}"
    echo -e "  - Ghostty: Download from https://ghostty.org/"
    echo -e "  - Starship: Install via package manager or from https://starship.rs/"
    echo -e "  - Neovim: Install via package manager (apt, dnf, etc.)"
    echo -e "  - Zsh: Install via package manager (apt, dnf, etc.)"
fi