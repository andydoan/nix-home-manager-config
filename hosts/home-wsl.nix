{ config, pkgs, ... }:

{
  # Ubuntu-specific configurations
  home.packages = with pkgs; [
    magic-wormhole
  ];

  # Other Ubuntu-specific settings
}