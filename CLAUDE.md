# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), a cross-platform dotfile manager. The repository contains configuration files, scripts, and templates for macOS and Linux systems, with environment-specific settings for personal and work machines.

## Essential Commands

### Chezmoi Operations
- `chezmoi apply` - Apply dotfile changes to the home directory
- `chezmoi diff` - See what changes will be applied before applying them
- `chezmoi add <file>` - Add an existing file from the home directory to chezmoi management
- `chezmoi edit <file>` - Edit a managed file
- `chezmoi update` - Pull latest changes from the remote repository

### Development Workflow
1. Edit files directly in the chezmoi source directory (`~/.local/share/chezmoi/`)
2. Test changes with `chezmoi diff`
3. Apply changes with `chezmoi apply`
4. Commit changes using git in the chezmoi source directory

## Architecture and Key Components

### Directory Structure
- **Templates (.tmpl files)**: Files ending in `.tmpl` use Go templating to handle machine-specific configurations
- **Encrypted files (private_*)**: Files/directories prefixed with `private_` are encrypted using 1Password
- **Executable scripts (executable_*)**: Scripts prefixed with `executable_` will have executable permissions when applied
- **Run scripts (run_*)**:
  - `run_once_*`: Execute once on each machine
  - `run_onchange_*`: Execute when their contents change

### Key Configuration Files
- `.chezmoi.toml.tmpl` - Main chezmoi configuration template that determines personal/work settings based on email
- `dot_zshrc.tmpl` - Zsh configuration with conditional blocks for different environments
- `private_dot_gitconfig.tmpl` - Git configuration with user-specific settings
- `run_once_install-packages.sh.tmpl` - Bootstrap script for installing system dependencies

### Environment Detection
The system detects and configures for:
- **personal**: Personal machines
- **work**: Work machines (Shopify)
- **work_mac**: macOS work machines
- **work_linux**: Linux work machines (development containers)

### Managed Applications
- **Terminal**: Ghostty, iTerm2
- **Editor**: Neovim (configuration in `private_dot_config/nvim/`)
- **Keyboard**: Karabiner-Elements (configuration in `private_dot_config/private_karabiner/`)
- **Shell**: Zsh with Oh My Zsh
- **Version Control**: Git with custom utilities in `bin/`
- **Window Management**: Rectangle (macOS)

### Custom Scripts
The `bin/` directory contains custom git utilities and helper scripts:
- `git-amend`, `git-churn`, `git-wtf` - Git workflow helpers
- `gn` - Custom script for quick operations
- `wifi-password` - Utility for retrieving WiFi passwords

## Important Notes

- Secrets are managed through 1Password CLI integration
- The repository uses conditional logic based on the email address to apply different configurations for personal vs work environments
- macOS-specific configurations include Homebrew package management and application preferences stored in `.plists/`