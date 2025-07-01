{
  config,
  lib,
  pkgs,
  ...
}:
let
  aliases = import ./shell-aliases.nix;
in
{
  enable = true;
  package = pkgs.zsh;
  completionInit = lib.mkOrder 550 ''
    fpath+="/Applications/OrbStack.app/Contents/Resources/completions/zsh"
    autoload -Uz compinit
    compinit -u
  '';
  dotDir = ".config/zsh";
  enableCompletion = true;
  enableVteIntegration = true;
  history = {
    append = true;
    findNoDups = true;
    ignoreSpace = false;
    path = "$HOME/.config/zsh/zsh_history";
    save = 1000000;
    share = true;
    size = 1000000;
  };
  historySubstringSearch = {
    enable = true;
    searchUpKey = [
      "^[[1;2A"
      "^[[1;2$terminfo[kcuu1]"
    ];
    searchDownKey = [
      "^[[1;2B"
      "^[[1;2$terminfo[kcud1]"
    ];
  };
  initContent =
    let
      setOptAutoCD = "setopt auto_cd"; # Allows changing directories by typing just the directory name
      setOptAutoPush = "setopt auto_pushd"; # Pushes the current directory onto the directory stack when changing directory
      setOptPushIgnoreDup = "setopt pushd_ignore_dups"; # Prevents duplicate entries in the directory stack
      setOptPushReverse = "setopt pushdminus"; # Reverses the pushd order
    in
    lib.mkMerge [
      setOptAutoCD
      setOptAutoPush
      setOptPushIgnoreDup
      setOptPushReverse
      (builtins.readFile ../shell-scripts/key-bindings.sh)
      (builtins.readFile ../shell-scripts/rfapps.sh)
      ''
        eval "$(op completion zsh)"
        compdef _op op
      ''
      ''
        source "$XDG_CONFIG_HOME/zsh/plugins/code-stats-zsh/codestats.plugin.zsh"
      ''
    ];
  plugins = lib.mkOrder 551 [
    {
      name = "fzf-tab";
      file = "share/fzf-tab/fzf-tab.plugin.zsh";
      src = pkgs.zsh-fzf-tab;
    }
  ];
  shellAliases = aliases.shellAliases // aliases.zsh.shellAliases;
  shellGlobalAliases = aliases.zsh.shellGlobalAliases;
  syntaxHighlighting = {
    enable = true;
    package = pkgs.zsh-syntax-highlighting;
    highlighters = [
      "main"
      "brackets"
      "line"
    ];
  };
}
