{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = ["ignoredups" "ignorespace"];
    historyFileSize = 100000;
    historySize = 1000;
    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
    ];
    shellAliases = {
      # Navigation
      ".." = "cd ..";
      # Git aliases
      gac = "git commit -a";
      gd = "git diff --patch-with-stat";
      gds = "git diff --stat";
      gs = "git status -s";
      gl = "git status --long";
      gpu = "git push";
      gco = "git checkout";
      gb = "git branch";
      # Other aliases
      take = "take";
      did = "echo '' >> ~/did.txt && date >> ~/did.txt && hx ~/did.txt";
      vac = ". venv/bin/activate";
      copy = "xclip -sel clip";

      # Aliases for `ls` with color output
      ls = "ls --color=auto";
      ll = "ls -lh --color=auto";  # Long listing with human-readable sizes
      la = "ls -alh --color=auto"; # Include hidden files with long listing
    };

    initExtra = ''
      # Case-insensitive autocomplete
      bind "set completion-ignore-case on"
      bind "set show-all-if-ambiguous on"

      # Customize `ls` colors using `LS_COLORS`
      eval "$(dircolors -b)"

      # Make grep more user friendly by highlighting matches and exclude grepping through .svn folders.
      alias grep='grep --color=auto --exclude-dir=\.svn'

      # Git log function
      glog() {
          GENERAL_FLAGS=(--abbrev-commit)
          COMMON_COMMITS_FLAGS=(--date='local' --format="  %Cblue%h %Creset%>(24)%ad %Cred%>(20)%aN %Creset%<(60,trunc)%s")
          LOCAL_COMMITS_ONLY_FLAGS=(--date='local' --format="* %Cblue%h %Creset%>(24)%ad %Cred%>(20)%aN %C(Yellow)%<(60,trunc)%s%Creset")
          REMOTE_HEAD='origin'
          git show $REMOTE_HEAD &> /dev/null
          REMOTE_HEAD_EXISTS=$?
          # show all log entries
          if [ $# -eq 0 ]; then
              if [ $REMOTE_HEAD_EXISTS -ne 0 ]; then
                  git log "''${GENERAL_FLAGS}" --format="%Cgreen%h %Cblue%ad %Cred%aN %Creset%s"
              else
                  (git log "''${GENERAL_FLAGS}" "''${LOCAL_COMMITS_ONLY_FLAGS[@]}" "''${REMOTE_HEAD}"..HEAD --color=always; git log "''${GENERAL_FLAGS}" "''${COMMON_COMMITS_FLAGS[@]}" "''${REMOTE_HEAD}" --color=always) | less -r
              fi
          # show a certain number of log entries
          else
              re='^[0-9]+$'
              if echo $1 | grep -E $re > /dev/null ; then
                  if [ $REMOTE_HEAD_EXISTS -ne 0 ]; then
                      git log "''${GENERAL_FLAGS}" --format="%Cgreen%h %Cblue%ad %Cred%aN %Creset%s" -$1
                  else
                      remaining=`expr $1 - $(git log "''${GENERAL_FLAGS}" "''${LOCAL_COMMITS_ONLY_FLAGS[@]q}" "''${REMOTE_HEAD}"..HEAD | wc -l)`
                      git log "''${GENERAL_FLAGS}" "''${LOCAL_COMMITS_ONLY_FLAGS[@]}" "''${REMOTE_HEAD}"..HEAD -"$1"
                      # the specified number of entries is more than the number of local only commits, so show the rest
                      if [ "''${remaining}" -gt 0 ] ; then
                          git log "''${GENERAL_FLAGS}" "''${COMMON_COMMITS_FLAGS[@]}" "''${REMOTE_HEAD}" -"''${remaining}"
                      fi
                  fi
              else
                  echo "usage: glog [<number of entries>]"
              fi
          fi
      }
      alias glog=glog

      # take function
      take() {
          mkdir $1 && cd $1
      }

      # capture and return functions
      cap () { tee /tmp/capture.out; }
      ret () { cat /tmp/capture.out; }
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
}
