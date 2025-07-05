{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  enableBashIntegration = true;
  enableZshIntegration = true;
  package = pkgs.fzf;
  changeDirWidgetCommand = "fd --type d --hidden --follow --strip-cwd-prefix --exclude node_modules --exclude .astro --exclude .cache --exclude .git --exclude .cargo";
  changeDirWidgetOptions = [
    "--preview 'eza --tree --only-dirs --show-symlinks --level=3 --icons=always --color=always | head -200'"
  ];
  colors = {
    fg = "#c0caf5";
    bg = "#1a1b26";
    hl = "#7aa2f7";
    "fg+" = "#c0caf5";
    "bg+" = "#33467c";
    "hl+" = "#7dcfff";
    prompt = "#9ece6a";
    pointer = "#bb9af7";
    marker = "#f7768e";
    spinner = "#e0af68";
    header = "#414868";
    gutter = "#24283b";
    info = "#a9b1d6";
  };
  defaultCommand = "fd --type f";
  defaultOptions = [
    "--height 50%"
    "--layout=reverse"
    "--border"
    "--prompt='❯ '"
    "--pointer='→'"
    "--marker='✓'"
  ];
  fileWidgetCommand = "fd --type f --hidden --follow --strip-cwd-prefix --exclude node_modules --exclude .astro --exclude .cache --exclude .git --exclude .cargo";
  fileWidgetOptions = [
    "--preview 'bat --style=numbers --color=always {1} | head -200'"
  ];
}
