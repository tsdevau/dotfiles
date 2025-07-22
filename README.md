# Dotfiles
**My personal [Chezmoi](https://www.chezmoi.io/) dotfiles, configurations, themes, and developer tools for macOS.**

<br/>
<div align="center">
<img src="https://raw.githubusercontent.com/tsdevau/dotfiles/main/assets/tsdevau.png" width="150">
&nbsp;
&nbsp;
&nbsp;
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/sample.png" width="300">
&nbsp;
&nbsp;
&nbsp;
<img src="https://raw.githubusercontent.com/tsdevau/dotfiles/main/assets/tpstech.png" width="150">

</div>

## 🌟 Overview

This repository contains my personal [Chezmoi](https://www.chezmoi.io/) configuration for macOS. It's designed to provide a consistent, beautiful, and efficient development environment across multiple machines. The setup is highly automated, leveraging Homebrew for package management, 1Password for secrets, and a suite of modern, CLI tools.

### ✨ Features

- **Declarative Package Management**: All packages, casks, and applications are defined in `.chezmoidata/*.jsonc` files and installed via a templated Homebrew `Brewfile`.
- **1Password Integration**: Securely manages secrets and sensitive data like Git signing keys using the 1Password CLI and the `onepasswordRead` template function.
- **macOS Optimisation**: Includes scripts to apply sensible macOS defaults, enhancing the user experience for developers.
- **Comprehensive Tooling**: Pre-configured settings for a wide range of development tools, including multiple editors (VSCode, Zed, Helix, Neovim), shell tools, and more.
- **XDG Compliance**: Follows the XDG Base Directory Specification for a clean and organised home directory.
- **Modern Shell Environment**: A powerful and customisable Zsh setup featuring the Starship prompt, `fzf`, `zoxide`, and various plugins.
- **Automated Setup**: Scripts for initial setup and ongoing maintenance, including Homebrew installation, package updates, and environment configuration.

## 🚀 Getting Started

### Prerequisites

1.  **1Password**: Ensure you have [1Password](https://1password.com/) and the [1Password CLI](https://developer.1password.com/docs/cli/get-started/) installed and configured.
2.  **Chezmoi**: Install Chezmoi using Homebrew: `brew install chezmoi`.
3.  **macOS**: This configuration is tailored specifically for macOS.

### Initial Setup

You can initialise this configuration on a new machine with a single command:

```bash
chezmoi init --apply https://github.com/tsdevau/dotfiles.git
```

This will clone the repository and apply the dotfiles to your home directory.

## 📂 Repository Structure

This repository is organised to be modular and easy to navigate. Here's a breakdown of the key directories and files:

-   `.chezmoiignore`: Specifies files and directories that Chezmoi should ignore.
-   `.chezmoidata/`: Contains JSONC files with data for templates, including package lists and user information.
-   `.chezmoiscripts/`: Holds scripts that run at different stages of the `chezmoi apply` process.
-   `private_dot_config/`: The heart of the configuration, following the XDG specification. It contains settings for various applications.
-   `private_dot_ssh/`: Manages SSH configuration.
-   `private_Library/`: Contains macOS-specific application support files and settings.

### Core Configuration Files

-   `private_dot_config/chezmoi/chezmoi.jsonc`: Main Chezmoi configuration, including Git auto-commit settings.
-   `.chezmoidata/data.jsonc`: General user data and editor preferences.
-   `.chezmoidata/homebrew.jsonc`: Lists Homebrew taps, formulae, and casks.
-   `.chezmoidata/mas.jsonc`: Lists Mac App Store applications to be installed.
-   `.chezmoidata/pnpm.jsonc`: Lists global pnpm packages.
-   `.chezmoidata/rust.jsonc`: Specifies Rust toolchains and components.

### Run Scripts

The `.chezmoiscripts/` directory contains scripts that automate the setup process:

-   `run_once_before_01-configure-touch-id.sh`: Configures Touch ID and Apple Watch for `sudo` authentication.
-   `run_once_before_02-install-homebrew.sh`: Installs Homebrew if it's not already present.
-   `run_once_after_03-install-homebrew-bundle.sh.tmpl`: Installs and updates packages from the `Brewfile`.
-   `run_once_after_05-configure-dev-env.sh.tmpl`: Sets up the development environment, including pnpm and Rust.
-   `run_once_after_06-configure-shell-plugins.sh`: Installs Zsh plugins.
-   `run_once_after_99-apply-macos-defaults.sh`: Applies custom macOS system defaults.

## 📦 Package Management

This setup uses a declarative approach to package management. All packages are defined in the `.chezmoidata/` directory and installed using a templated `Brewfile`.

To add a new package:

1.  Edit the appropriate file in `.chezmoidata/` (e.g., `homebrew.jsonc` for a new cask).
2.  Run `chezmoi apply`.
3.  The `run_once_after_03-install-homebrew-bundle.sh.tmpl` script will automatically detect the changes and install the new packages.

## 🔒 1Password Integration

This configuration leverages 1Password for secure management of secrets. The Git configuration, for example, retrieves the GPG signing key directly from 1Password:

```toml
signingkey = \{\{ `onepasswordRead "op://Personal/l4c4htdjojwcfanbjr2hqxeufm/Section_yfmxturzjnv4gl3aqas3jjhamy/signingkey"` \}\}
```

This ensures that sensitive information is never stored directly in the repository.

## 🧑‍💻 User Configuration

You can customise the configuration by editing the files in the `.chezmoidata/` directory. For example, you can change your name, email, and preferred editors in `data.jsonc`:

```json
{
  "editors": {
    "gui": "code",
    "tui": "hx",
    "visual": "code --wait"
  },
  "user": {
    "email": "mrjones@example.com",
    "githubUsername": "mrjones",
    "name": "Mr. Jones"
  }
}
```

## 🛠️ Commands

Here are some common commands for managing your dotfiles with Chezmoi:

-   `chezmoi apply`: Apply any changes to your dotfiles.
-   `chezmoi diff`: See what changes would be made without applying them.
-   `chezmoi edit ~/.config/git/config`: Edit a managed file directly.
-   `chezmoi update`: Pull the latest changes from the source repository.
-   `chezmoi doctor`: Check for any issues with your setup.

## 🎨 Theming

This configuration uses the [Catppuccin](https://github.com/catppuccin) theme across a wide range of applications, providing a consistent and beautiful user experience. You'll find Catppuccin themes for:

-   Bat
-   Ghostty
-   Glamour
-   Glow
-   Helix
-   And many more...

---

## 🤝 Contributing

While this is a personal configuration, I'm happy to receive suggestions and contributions. Feel free to open an issue or a pull request if you have ideas for improvements.

## 📜 License

This project is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for details.