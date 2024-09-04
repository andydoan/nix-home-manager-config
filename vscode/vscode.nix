# vscode-config.nix

{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    settings = {
      "diffEditor.renderSideBySide" = false;
      "explorer.confirmDelete" = false;
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "workbench.colorTheme" = "Material Theme Darker";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.fontSize" = 14;
    };

    keybindings = [
      {
        key = "ctrl+t";
        command = "workbench.action.files.newUntitledFile";
      }
      {
        key = "ctrl+n";
        command = "workbench.action.newWindow";
      }
      {
        key = "ctrl+shift+l";
        command = "editor.action.insertCursorAtEndOfEachLineSelected";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+tab";
        command = "workbench.action.nextEditor";
      }
      {
        key = "ctrl+shift+tab";
        command = "workbench.action.previousEditor";
      }
    ];

