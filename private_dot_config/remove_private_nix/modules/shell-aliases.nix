{
  shellAliases = {
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "trash";
    rmdir = "trash";
    mkdir = "mkdir -p";
    md = "mkdir";
    rd = "rmdir";
    cls = "clear";

    ip = "ip -c";
    bat = "bat --color=always --italic-text=always --decorations=always";
    less = "less -FX";
    wget = ''wget --hsts-file="$XDG_CONFIG_HOME/wget-hsts"'';

    grep = "grep --color=always";
    fgrep = "fgrep --color=always";
    egrep = "egrep --color=always";

    cd = "z";

    ls = "eza --long --color=always --icons=always --hyperlink --group-directories-first --git";
    lsa = "ls --all";
    lst = "eza --tree --level 3";
  };

  zsh.shellAliases = {
    zshenv = "source \"$HOME/.zshenv\"";
    zshrc = "source \"$ZDOTDIR/.zshrc\"";

    # Nix Commands
    nixall = "nixup && nixbl && nixgc";
    nixgc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
    nixbl = "cd \"$XDG_CONFIG_HOME/nix\" && sudo darwin-rebuild switch --flake .#hugo && source \"$HOME/.zshenv\" && source \"$XDG_CONFIG_HOME/zsh/.zshrc\" && cd - || cd";
    nixup = "cd \"$XDG_CONFIG_HOME/nix\" && nix flake update && cd - || cd";

    # code = "$DEFAULT_VISUAL";
    "code." = "\"$DEFAULT_VISUAL\" .";
    neofetch = "fastfetch";
    y = "yadm";
    ghc = "gh copilot ";
    ghcc = "gh copilot config ";
    ghce = "gh copilot explain ";
    ghcs = "gh copilot suggest ";

    # Directly Managed
    codeconfig = "$DEFAULT_VISUAL \"$HOME/Library/Application Support/Code/User/settings.json\"";
    dprintconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/dprint/dprint.json\"";
    knownhostsconfig = "$DEFAULT_VISUAL \"$HOME/.ssh/known_hosts\"";
    nvimconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nvim/lua\"";
    sshconfig = "$DEFAULT_VISUAL \"$HOME/.ssh/config\"";
    hammerspoonconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/hammerspoon\"";

    # Nix Managed
    aerospaceconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/aerospace.nix\"";
    aliasconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/modules/shell-aliases.nix\"";
    bordersconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfile/borders.nix\"";
    brewconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/modules/homebrew.nix\"";
    envconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/modules/shell-env.nix\"";
    fastfetchconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/fastfetch.nix\"";
    ghosttyconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/ghostty.nix\"";
    gitconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/git.nix\"";
    helixconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/helix\"";
    homebrewconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/modules/homebrew.nix\"";
    hxconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/helix\"";
    keyconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/shell-scripts/key-bindings.sh\"";
    nixconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix\"";
    rfappsconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/shell-scripts/rfapps.sh\"";
    starshipconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/starship.nix\"";
    weztermconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/wezterm\"";
    yaziconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/modules/home-manager.nix\"";
    zedconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/dotfiles/zed-editor.nix\"";
    zshconfig = "$DEFAULT_VISUAL \"$XDG_CONFIG_HOME/nix/modules/shell-zsh.nix\"";
  };

  zsh.shellGlobalAliases = {
    "..." = "../..";
    "...." = "../../..";
    "....." = "../../../..";
    "......" = "../../../../..";
  };
}
