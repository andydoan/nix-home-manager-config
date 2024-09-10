{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;

    userSettings = {
      "diffEditor.renderSideBySide" = false;
      "explorer.confirmDelete" = false;
      "workbench.colorTheme" = "Material Theme Darker";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.fontSize" = 14;

      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.rulers" = [ 80 ];          # Show a ruler at 80 characters
      "editor.wordWrap" = "on";          # Enable word wrapping
      "editor.wordWrapColumn" = 80;      # Set word wrap column to 80
      "editor.wrappingIndent" = "indent";  # Indent wrapped lines
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

    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      visualstudioexptteam.vscodeintellicode
      github.github-vscode-theme
      tamasfe.even-better-toml
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "pylint";
        publisher = "ms-python";
        version = "2023.10.1";
        sha256 = "1tI5u33c5CHFQxkJZ/OxW3ZA5qPr4RoCIf6dqIMPykQ=";
      }
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.113.1";
        sha256 = "/tyyjf3fquUmjdEX7Gyt3MChzn1qMbijyej8Lskt6So=";
      }
      {
        "name" = "vscode-todo-highlight";
        "version" = "2.0.8";
        "publisher" = "jgclark";
        sha256 = "/CctaLcG+dA2Cf69/ACeDKdRLsu/VUGbAxUbyhI0VyA=";
      }
      {
        "name" = "prettier-vscode";
        "version" = "11.0.0";
        "publisher" = "esbenp";
        sha256 = "pNjkJhof19cuK0PsXJ/Q/Zb2H7eoIkfXJMLZJ4lDn7k=";
      }
    ];
  };
}
