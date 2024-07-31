{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = ''
        [╭─](white)$time $username$hostname $directory$git_branch$python$nix_shell$env_var$cmd_duration
        [╰─](white)$character '';

      time = {
        format = "[[\\[$time\\]]($style)]($style)";
        style = "dimmed #FFFFFF";
        time_format = "%T";
        disabled = false;
      };

      username = {
        show_always = true;
        style_root = "bold red";
        style_user = "bold yellow";
        format = "[$user]($style)";
        disabled = false;
      };

      hostname = {
        ssh_symbol = " ";
        format = "@[$hostname](bold red)";
        trim_at = ".companyname.com";
        disabled = false;
      };

      directory = {
        read_only = "🔒";
        style = "bold cyan";
        read_only_style = "red";
        truncation_length = 8;
        truncation_symbol = "../";
        format = "[$read_only]($read_only_style)[$path]($style) ";
        disabled = false;
      };

      cmd_duration = {
        show_milliseconds = true;
        style = "bold yellow";
        format = "took [$duration]($style)";
      };

      character = {
        format = "$symbol";
        success_symbol = "[❯](bold green)";
        error_symbol = "[✗](bold red) ";
        disabled = false;
      };

      aws.symbol = "  ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      crystal.symbol = " ";
      dart.symbol = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fennel.symbol = " ";
      fossil_branch.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell = {
        format = "via [$symbol$state( \\($name\\))]($style) ";
        heuristic = true;
        symbol = " ";
      };
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      pijul_channel.symbol = " ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      swift.symbol = " ";
      zig.symbol = " ";

      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        AlmaLinux = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Kali = " ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        RockyLinux = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Void = " ";
        Windows = "󰍲 ";
      };

      env_var.SHLVL = {
        variable = "SHLVL";
        symbol = "";
        format = "[$symbol $env_value]($style) ";
      };
    };
  };
}
