# Chezmoi Configuration

This is a comprehensive Chezmoi configuration for macOS development environments with declarative package management using Homebrew and secure secrets management with 1Password.

## Features

- **Declarative Package Management**: All packages defined in `.chezmoidata.toml` and installed via Homebrew
- **1Password Integration**: Secure secrets management using 1Password CLI with `onepasswordRead` template function
- **macOS Optimisation**: Comprehensive system defaults for Dock, Finder, keyboard, and system settings
- **Development Environment**: Pre-configured Git, shell, and modern development tools (Helix, Neovim, Zed, etc.)
- **Modular Configuration**: Template-based configuration with environment-specific customisation
- **XDG Base Directory**: Full XDG specification compliance for clean config organisation
- **Modern Shell Setup**: Zsh with Starship prompt, fzf, zoxide, and custom plugins
- **Touch ID Integration**: Automated Touch ID and Apple Watch configuration for sudo

## Prerequisites

1. **1Password**: Install 1Password and the 1Password CLI
2. **Chezmoi**: Install Chezmoi (`brew install chezmoi`)
3. **macOS**: This configuration is specifically designed for macOS

## Initial Setup

1. **Initialise with this directory**:
   ```bash
   chezmoi init --apply ~/.local/share/chezmoi
   ```

2. **Or clone from source**:
   ```bash
   chezmoi init --apply https://github.com/tsdevau/dotfiles.git
   ```

## Configuration Structure

### Core Files
- `chezmoi.toml` - Main chezmoi configuration with git auto-commit/push settings
- `.chezmoidata.toml` - Package definitions, user data, and template variables
- `.chezmoiignore` - Files to ignore during application (README.md, .DS_Store, etc.)

### XDG Configuration Directory
The `private_dot_config/` directory follows the XDG Base Directory specification:
- `private_git/` - Git configuration with 1Password GPG key integration
- `private_zsh/` - Zsh configuration with modern shell tools
- `private_env/` - Environment variables, aliases, and shell functions
- `private_nvim/` - Neovim configuration with LazyVim
- `private_helix/` - Helix editor configuration
- `private_starship/` - Starship prompt configuration
- `private_homebrew/` - Homebrew Brewfile template
- `private_ssh/` - SSH configuration (no 1Password templates - uses static config)

### Run Scripts
- `run_once_before_01-configure-touch-id.sh` - Configure Touch ID/Apple Watch for sudo
- `run_once_before_02-install-homebrew.sh` - Install Homebrew if not present
- `run_onchange_after_03-install-homebrew-bundle.sh.tmpl` - Install/update packages via Brewfile
- `run_onchange_after_05-configure-dev-env.sh.tmpl` - Set up development environment (pnpm, Rust, etc.)
- `run_onchange_after_06-configure-shell-plugins.sh` - Install zsh plugins
- `run_onchange_after_99-apply-macos-defaults.sh.tmpl` - Apply macOS system defaults

### Template Files
- `private_dot_config/private_git/config.tmpl` - Git configuration with 1Password signing key
- `private_dot_config/private_zsh/dot_zshrc.tmpl` - Zsh configuration
- `private_dot_config/private_env/aliases.tmpl` - Shell aliases
- `private_dot_config/private_env/exports.tmpl` - Environment variables
- `private_dot_config/private_homebrew/brewfile.tmpl` - Homebrew package manifest

## Package Management

All packages are defined in `.chezmoidata.toml` under the `[homebrew]` section:

```toml
[homebrew]
taps = ["FelixKratz/formulae", "oven-sh/bun", "supabase/tap"]
formulae = [
  { name = "helix" },
  { name = "starship" },
  { name = "zoxide" },
  # ... more packages
]
casks = [
  { name = "visual-studio-code" },
  { name = "cursor" },
  # ... more applications
]

[masApps]
"1Password for Safari" = 1569813296
"Xcode" = 497799835

[pnpm]
packages = [
  "@google/gemini-cli",
  "claude-code",
  "tsx",
  "wrangler",
]

[rustup]
components = ["rustfmt", "clippy"]
toolchains = [{ name = "stable", profile = "default" }]
```

To add new packages:
1. Edit `.chezmoidata.toml`
2. Run `chezmoi apply`
3. The `run_onchange_*` scripts will automatically install new packages

## 1Password Integration

This configuration uses 1Password for secure secrets management:

1. **Git Signing Key**: Automatically retrieved using `onepasswordRead` in Git config
2. **1Password CLI Integration**: Configured in shell environment
3. **Biometric Unlock**: Enabled for seamless CLI authentication

The Git configuration template shows the actual usage:
```bash
signingkey = {{ onepasswordRead "op://Personal/.../signingkey" }}
```

## User Configuration

The configuration uses template variables defined in `.chezmoidata.toml`:

```toml
name = "Mr Jones"
email = "mr.jones@example.com"
githubUsername = "mrjones"
defaultVisualEditor = "code"
editor = "hx"
language = "en_AU.UTF-8"
```

## Commands

### Daily Usage
```bash
# Apply changes
chezmoi apply

# Check what would change
chezmoi diff

# Edit a managed file
chezmoi edit ~/.config/git/config

# Update from source repository
chezmoi update
```

### Package Management
```bash
# Update packages when configuration changes
chezmoi apply

# Force package reinstallation (reset run_onchange state)
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

### Troubleshooting
```bash
# Check system health
chezmoi doctor

# View all managed files
chezmoi managed

# Reset and reapply everything
chezmoi state reset
chezmoi apply
```

## Actual Directory Structure

```
.
├── empty_dot_hushlogin                     # Disable login messages
├── private_dot_zshenv                      # Zsh environment setup
├── run_once_before_01-configure-touch-id.sh
├── run_once_before_02-install-homebrew.sh
├── run_onchange_after_03-install-homebrew-bundle.sh.tmpl
├── run_onchange_after_05-configure-dev-env.sh.tmpl
├── run_onchange_after_06-configure-shell-plugins.sh
├── run_onchange_after_99-apply-macos-defaults.sh.tmpl
├── private_dot_config/
│   ├── private_chezmoi/
│   │   ├── chezmoi.toml                    # Chezmoi configuration
│   │   ├── .chezmoidata.toml               # Template data and packages
│   │   ├── .chezmoiignore                  # Files to ignore
│   │   └── README.md                       # This file
│   ├── private_bat/                        # Bat (cat replacement) config
│   ├── private_borders/                    # Window border tool config
│   ├── private_env/                        # Environment configuration
│   │   ├── aliases.tmpl
│   │   ├── exports.tmpl
│   │   ├── functions
│   │   └── private_rfapps
│   ├── private_git/                        # Git configuration
│   │   ├── config.tmpl
│   │   └── gitignore_global
│   ├── private_helix/                      # Helix editor config
│   ├── private_homebrew/                   # Homebrew configuration
│   │   └── brewfile.tmpl
│   ├── private_nvim/                       # Neovim configuration
│   ├── private_starship/                   # Starship prompt config
│   ├── private_wezterm/                    # WezTerm configuration
│   ├── private_yazi/                       # Yazi file manager config
│   ├── private_zed/                        # Zed editor configuration
│   └── private_zsh/                        # Zsh configuration
│       ├── dot_zshrc.tmpl
│       ├── key-bindings.sh
│       ├── private_dot_zshenv.tmpl
│       └── symlink_zsh_history
├── private_dot_ssh/
│   ├── config                              # SSH configuration (static)
│   └── dot_gitkeep
└── private_Library/                        # macOS Library files
```

## Modern Development Tools

This configuration includes modern alternatives to traditional Unix tools:

- **`bat`** instead of `cat` (syntax highlighting)
- **`eza`** instead of `ls` (modern file listing)
- **`fd`** instead of `find` (fast file search)
- **`ripgrep`** instead of `grep` (fast text search)
- **`zoxide`** instead of `cd` (smart directory jumping)
- **`fzf`** for fuzzy finding
- **`starship`** for a modern shell prompt
- **`helix`** as primary editor with Neovim as fallback

## Contributing

1. Make your changes to the appropriate files
2. Test with `chezmoi apply --dry-run`
3. Apply changes with `chezmoi apply`
4. Commit changes automatically (auto-commit is enabled)

## Security

- 1Password integration for sensitive data (GPG keys, tokens)
- SSH configuration uses static files (no templates for security)
- Private files are marked with `private_` prefix
- All scripts are idempotent and safe to run multiple times
- Touch ID/Apple Watch authentication for sudo commands
