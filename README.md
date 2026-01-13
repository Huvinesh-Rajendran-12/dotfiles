# Cross-Platform Dotfiles

A collection of configuration files for various development tools that work across macOS and Linux systems.

## Included Configurations

### 🐚 Ghostty Terminal
- Custom terminal configuration with themes
- Includes `aamis` and `starship-sync` themes
- Cross-platform compatible settings

### ⭐ Starship Prompt
- Beautiful and fast shell prompt
- Customized for directory, git status, and language indicators
- Works with bash, zsh, fish, and other shells

### 📝 Neovim
- Kickstart.nvim configuration
- LSP support, autocompletion, and syntax highlighting
- Custom theme (Aether) with extensive plugin ecosystem

### 🤖 OpenCode
- Configuration for OpenCode AI assistant
- Python workflow settings

### 🐚 Zsh
- Oh My Zsh configuration with Powerlevel10k theme
- Custom aliases and environment variables
- Syntax highlighting and autosuggestions
- Integration with Starship prompt

## Installation

### Prerequisites

Make sure you have the following tools installed:

#### macOS
```bash
# Using Homebrew
brew install ghostty starship neovim zsh
```

#### Linux
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim zsh

# Or use your preferred package manager
```

For Starship and Ghostty, download from their official websites:
- [Starship](https://starship.rs/)
- [Ghostty](https://ghostty.org/)

### Quick Install

1. Clone this repository:
```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

2. Run the installation script:
```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

The script will:
- Create backups of existing configurations
- Create symlinks to the new configurations
- Provide OS-specific installation notes

### Manual Installation

If you prefer to set up configurations manually:

```bash
# Ghostty
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sf ~/dotfiles/ghostty/themes/* ~/.config/ghostty/themes/

# Starship
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# Neovim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

# OpenCode
ln -sf ~/dotfiles/opencode/package.json ~/.config/opencode/package.json
ln -sf ~/dotfiles/opencode/CLAUDE.md ~/.claude/CLAUDE.md

# Zsh
ln -sf ~/dotfiles/zshrc ~/.zshrc
```

## Configuration Details

### Ghostty
- Font: System default (configurable)
- Theme: `aamis` (dark theme)
- Window padding: 8px
- Custom keybindings for copy/paste and window management

### Starship
- Shows directory, git status, and language indicators
- Custom symbols and colors
- Optimized for performance

### Neovim
- Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Includes LSP, autocompletion, and treesitter
- Custom Aether color scheme
- Extensive plugin ecosystem

## Customization

### Adding New Themes
1. Add theme files to `ghostty/themes/`
2. Update the theme in `ghostty/config`

### Modifying Neovim Config
- Edit `nvim/init.lua` for core settings
- Add custom plugins by uncommenting the lazy import section

### Starship Customization
- Modify `starship/starship.toml` to add/remove modules
- Refer to [Starship documentation](https://starship.rs/config/)

## Troubleshooting

### Common Issues

1. **Fonts not displaying correctly**
   - Ensure you have a compatible monospace font installed
   - Update font-family in ghostty config

2. **Neovim plugins not loading**
   - Run `:Lazy sync` in Neovim
   - Check `:checkhealth` for issues

3. **Starship not showing**
   - Add `eval "$(starship init bash)"` (or your shell) to your shell config
   - Restart your terminal

### Backup and Restore

The installation script automatically creates backups with timestamps. To restore:

```bash
# Find backup files
find ~/.config -name "*.backup.*"

# Restore specific config
mv ~/.config/ghostty/config.backup.20240101_120000 ~/.config/ghostty/config
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on both macOS and Linux
5. Submit a pull request

## License

This project is open source. Feel free to use and modify as needed.