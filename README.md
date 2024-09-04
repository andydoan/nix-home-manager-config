# My Home Manager Configuration

This repository contains my personal configuration for 
[Home Manager](https://nix-community.github.io/home-manager/), managed with 
[Nix flakes](https://nixos.wiki/wiki/Flakes). It includes various settings for 
tools like Bash, Starship, Tmux, VSCode, and more.

## Structure

- `flake.nix`: Entry point for the flake-based configuration.
- `home.nix`: Main Home Manager configuration.
- `bash/`: Nix modules for Bash settings and aliases.
- `starship/`: Configuration for the Starship prompt.
- `tmux/`: Tmux settings and keybindings.
- `vscode/`: VSCode extensions and settings.

## Usage

To apply this configuration using `home-manager`:

```bash
home-manager switch --flake .#<your-hostname>
