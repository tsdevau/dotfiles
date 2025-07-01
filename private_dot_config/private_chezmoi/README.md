# Chezmoi Configuration

This is a comprehensive Chezmoi configuration for macOS development environments with declarative package management using Homebrew and secure secrets management with 1Password.

## Features

- **Declarative Package Management**: All packages defined in `.chezmoi.toml` and installed via Homebrew
- **1Password Integration**: Secure secrets management using 1Password CLI
- **macOS Optimisation**: Sensible defaults for Dock, Finder, and system settings
- **Development Environment**: Pre-configured Git, shell, and development tools
- **Modular Configuration**: Template-based configuration for easy customisation
- **XDG Base Directory**: Follows XDG specification for clean config organisation

## Prerequisites

1. **1Password**: Install 1Password and the 1Password CLI
2. **Chezmoi**: Install Chezmoi (`brew install chezmoi`)

## Initial Setup

1. **Clone this configuration**:
   ```bash
   chezmoi init --apply https://github.com/yourusername/dotfiles.git
   ```

2. **Or initialise with this directory**:
   ```bash
   chezmoi init --apply ~/.local/share/chezmoi
   ```

## Configuration Structure

### Core Files
- `.chezmoi.toml` - Main configuration with package lists and settings
- `.chezmoiignore` - Files to ignore based on machine type
- `.chezmoiexternal.toml` - External dependencies (Oh My Zsh, plugins)

### XDG Configuration Directory
The `private_dot_config/` directory follows the XDG Base Directory specification:
- `private_git/` - Git-specific configuration files
- `private_nvim/` - Neovim configuration
- `private_zsh/` - Zsh configuration and customisation

### Run Scripts
- `run_once_before_*` - Scripts that run once before applying dotfiles
- `run_once_after_*` - Scripts that run once after applying dotfiles  
- `run_onchange_*` - Scripts that run when configuration changes

### Dotfiles
- `config.tmpl` - Git configuration with aliases and settings
- `private_dot_config/private_git/private_gitignore_global` - Global gitignore patterns
- `dot_vimrc` - Vim configuration
- `private_dot_config/private_zsh/private_dot_zshrc.tmpl` - Zsh configuration with Oh My Zsh and plugins
- `private_dot_config/private_git/private_config.tmpl` - Git configuration
- `private_dot_config/private_nvim/vimrc` - Neovim configuration
- `private_dot_ssh/config.tmpl` - SSH configuration with 1Password integration

### Templates
- `.chezmoitemplates/` - Reusable templates for various configurations

## Package Management

All packages are defined in `.chezmoi.toml` under the `[data.homebrew]` section:

```toml
[data.homebrew]
    taps = ["homebrew/cask-fonts"]
    formulae = ["git", "zsh", "tmux", "vim"]
    casks = ["visual-studio-code", "iterm2"]
```

To add new packages:
1. Edit `.chezmoi.toml`
2. Run `chezmoi apply`
3. The `run_onchange_*` scripts will automatically install new packages

## 1Password Integration

SSH keys and sensitive configuration are managed through 1Password:

1. **Set up 1Password CLI**:
   ```bash
   op account add
   op signin
   ```

2. **Store secrets in 1Password** with the following structure:
   - Vault: "Private"
   - Item: "Work SSH Config"
   - Fields: "username"

3. **Use in templates**:
   ```
   {{ op "vaults/Private/items/Work SSH Config/fields/username" }}
   ```

## Customisation

### Machine Types
Set `workMachine = true` during initial setup for work-specific configurations:
- Additional development tools and packages
- Work-specific SSH configurations
- Conditional aliases and environment variables

### Adding New Packages
1. Add to the appropriate array in `.chezmoi.toml`
2. Run `chezmoi apply`

## Commands

### Daily Usage
```bash
# Apply changes
chezmoi apply

# Check what would change
chezmoi diff

# Edit configuration
chezmoi edit ~/.config/zsh/.zshrc

# Update from source
chezmoi update
```

### Package Management
```bash
# Update packages when configuration changes
chezmoi apply

# Force package reinstallation
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

### Troubleshooting
```bash
# Check status
chezmoi doctor

# View applied files
chezmoi managed

# Reset and reapply
chezmoi state reset
chezmoi apply
```

## Directory Structure

```
.
├── .chezmoi.toml                           # Main configuration
├── .chezmoiignore                          # Ignore rules
├── .chezmoiexternal.toml                   # External dependencies
├── .chezmoitemplates/                      # Reusable templates
│   ├── homebrew-packages.tmpl
│   ├── macos-defaults.tmpl
│   └── shell-aliases.tmpl
├── private_dot_config/                     # XDG config directory
│   ├── private_git/                        # Git configuration
│   │   ├── private_dot_config.tmpl
│   │   └── private_dot_gitignore_global
│   ├── private_nvim/                       # Neovim configuration
│   │   └── dot_vimrc
│   └── private_zsh/                        # Zsh configuration
│       └── private_dot_zshrc.tmpl
├── private_dot_ssh/                        # SSH configuration
│   ├── config.tmpl
│   └── dot_gitkeep
├── dot_gitconfig.tmpl                      # Git configuration
├── dot_gitignore_global                    # Global gitignore
├── dot_tmux.conf                           # Tmux configuration
├── dot_vimrc                               # Vim configuration
├── run_once_before_01-install-homebrew.sh # Homebrew installation
├── run_once_before_02-install-packages.sh.tmpl # Package installation
├── run_once_before_03-configure-macos.sh.tmpl # macOS configuration
├── run_once_after_01-configure-shell.sh   # Shell setup
├── run_once_after_02-setup-development.sh.tmpl # Development environment
├── run_onchange_before_homebrew-packages.sh.tmpl # Package updates
├── run_onchange_after_macos-settings.sh.tmpl # Setting updates
└── README.md                               # This file
```

## Contributing

1. Fork this repository
2. Make your changes
3. Test with `chezmoi apply --dry-run`
4. Submit a pull request

## Security

- SSH keys are managed through 1Password
- Sensitive files are marked as `private_`
- Work-specific configurations are conditionally included
- All scripts are idempotent and safe to run multiple times
