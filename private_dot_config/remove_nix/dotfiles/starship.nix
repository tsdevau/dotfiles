{
  config,
  lib,
  pkgs,
  ...
}:

{
  enable = true;
  package = pkgs.starship;
  enableBashIntegration = true;
  enableZshIntegration = true;
  # enableFishIntegration = false

  settings = {
    "$schema" = "https://starship.rs/config-schema.json";

    format = ''[╭─ ](fg:overlay1)$os$username$hostname$directory$git_branch$git_status$fill$bun$c$docker_context$dotnet$golang$lua$nodejs$php$python$time[ ─╮](fg:overlay1)$line_break[╰─ ](fg:overlay1)$character'';

    right_format = ''$status$cmd_duration[ ─╯](fg:overlay1)'';

    palette = "catppuccin_mocha";

    os = {
      disabled = false;
      style = "fg:text";
      format = "[$symbol]($style)";
      symbols = {
        Alpine = "";
        Debian = "";
        Linux = "";
        Macos = "";
        Redhat = "󱄛";
        RockyLinux = "";
        Ubuntu = "";
        Unknown = "";
        Windows = "";
      };
    };

    username = {
      show_always = true;
      style_user = "bold fg:lavender";
      style_root = "bold fg:red";
      format = "[ $user]($style)";
    };

    hostname = {
      style = "fg:sapphire";
      format = "[@](dimmed fg:white)[$hostname ]($style)";
      ssh_only = true;
    };

    directory = {
      style = "fg:blue";
      truncate_to_repo = false;
      read_only_style = "bold fg:red";
      before_repo_root_style = "dimmed fg:blue";
      repo_root_style = "bold fg:blue";
      read_only = " 󰌾";
      repo_root_format = "[$read_only ]($read_only_style)[$before_root_path]($before_repo_root_style)[$repo_root$path ]($repo_root_style)";
      format = "[$read_only ]($read_only_style)[$path ]($style)";
      truncation_length = 4;
      truncation_symbol = "…/";
    };

    git_branch = {
      symbol = "󰘬";
      style = "bold fg:green";
      format = "[$symbol $branch ]($style)";
    };

    git_status = {
      style = "fg:green";
      format = "[$all_status$ahead_behind]($style) ";
      ahead = "[$count ](fg:green)";
      behind = "[$count ](fg:maroon)";
      conflicted = "[ ](fg:red)";
      deleted = "[D$count ](fg:red)";
      diverged = "[](bold fg:yellow)";
      modified = "[M$count ](fg:flamingo)";
      renamed = "[$count ](fg:yellow)";
      staged = "[+$count ](fg:green)";
      stashed = "[*$count ](fg:purple)";
      untracked = "[U$count ](fg:orange)";
      up_to_date = "";
    };

    fill = {
      symbol = "─";
    };

    bun = {
      symbol = "";
      style = "bold fg:rosewater";
      format = "[ $symbol [$version](dimmed fg:rosewater)]($style)";
    };

    c = {
      symbol = "";
      style = "bold fg:blue";
      format = "[ $symbol [$version](dimmed fg:blue)]($style)";
    };

    docker_context = {
      symbol = "";
      style = "fg:blue";
      format = "[ $symbol [$context](dimmed fg:blue)]($style)";
    };

    dotnet = {
      symbol = "󰪮";
      style = "fg:mauve";
      format = "[ $symbol [$version](dimmed fg:mauve)]($style)";
    };

    golang = {
      symbol = "";
      style = "fg:sky";
      format = "[ $symbol [$version](dimmed fg:sky)]($style)";
    };

    lua = {
      symbol = "";
      style = "bold fg:blue";
      format = "[ $symbol [$version](dimmed fg:blue)]($style)";
    };

    nodejs = {
      symbol = "";
      style = "bold fg:green";
      format = "[ $symbol [$version](dimmed fg:green)]($style)";
    };

    php = {
      symbol = "";
      style = "fg:mauve";
      format = "[ $symbol [$version](dimmed fg:mauve)]($style)";
    };

    python = {
      symbol = "";
      style = "fg:yellow";
      format = "[ $symbol [$version](dimmed fg:yellow)]($style)";
    };

    time = {
      disabled = false;
      time_format = "%T";
      style = "fg:lavender";
      format = "[  $time]($style)";
    };

    line_break = {
      disabled = false;
    };

    character = {
      disabled = false;
      success_symbol = "[❯](bold fg:green)";
      error_symbol = "[❯](bold fg:red)";
      vimcmd_symbol = "[❮](bold fg:blue)";
      vimcmd_replace_one_symbol = "[❮](bold fg:lavender)";
      vimcmd_replace_symbol = "[❮](bold fg:lavender)";
      vimcmd_visual_symbol = "[❮](bold fg:yellow)";
    };

    status = {
      disabled = false;
      symbol = "[✖ $status]($style)";
      style = "bold fg:red";
      success_symbol = "✔";
      success_style = "bold fg:green";
      sigint_symbol = "";
      signal_symbol = "󱄙";
      not_found_symbol = "󱈍";
      not_executable_symbol = "󰛧";
      format = "[ $symbol]($style)";
    };

    cmd_duration = {
      disabled = false;
      min_time = 1000;
      format = "[ 󱫫 $duration]($style)";
      style = "fg:peach";
    };

    palettes.catppuccin_mocha = {
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
    };
  };
}
