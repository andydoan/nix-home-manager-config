{ config, pkgs, ... }:

{
  imports = [
    ./bash/bash.nix
    ./starship/starship.nix
    ./tmux/tmux.nix
    ./vscode/vscode.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "andy";
  home.homeDirectory = "/home/andy";

  # Packages to install
  home.packages = with pkgs; [
    #google-chrome
    #docker
    python310
    ripgrep
    fzf
    git
    #keepass
    #tailscale
    #vscode
    neofetch
    starship
    libreoffice
    vim
    helix
    tmux
    maestral
    maestral-gui
    xclip
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Firefox configuration
  programs.firefox = {
    enable = true;
    # Add any specific Firefox configurations here
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Andy Doan";
    userEmail = "adoan@nstrading.com";
    
    # Optional: Add extra configurations
    extraConfig = {
      init.defaultBranch = "master";
      core.editor = "hx";
    };

    # Optional: Configure Git aliases
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      # Add any other aliases you use
    };
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Fonts
  fonts.fontconfig.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
