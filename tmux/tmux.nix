{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "s";
    escapeTime = 0;
    customPaneNavigationAndResize = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "ssh-session cpu-usage ram-usage time"
          set -g @dracula-show-flags true
          set -g @dracula-show-left-icon session
          set -g @dracula-cpu-display-load false
          set -g @dracula-show-fahrenheit false
          set -g @dracula-show-location false
          set -g @dracula-military-time true
          set -g @dracula-ram-usage-label " "
          set -g @dracula-cpu-usage-label " "
          set -g @dracula-ssh-session-colors "light_purple dark_gray"
          set -g @dracula-cpu-usage-colors "yellow dark_gray"
          set -g @dracula-ram-usage-colors "red dark_gray"
          set -g @dracula-weather-colors "orange dark_gray"
          set -g @dracula-time-colors "dark_purple white"
        '';
      }
    ];
    extraConfig = ''
      bind s choose-session

      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      
      # switch panes using Ctrl+[hjkl] without prefix
      bind -n C-h select-pane -L
      bind -n C-l select-pane -R
      bind -n C-k select-pane -U
      bind -n C-j select-pane -D
      
      # Enable mouse control (clickable windows, panes, resizable panes)
      set -g mouse on
      
      # Toggle mouse with ^M; then report it's new status
      bind-key C-m set-option -g mouse \; display-message 'Mouse #{?mouse,on,off}'
      
      # don't rename windows automatically
      set-option -g allow-rename off
      
      set -g status-position bottom
      set -g @resurrect-capture-pane-contents 'on'
    '';
  };
}
