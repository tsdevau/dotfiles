{
  config,
  lib,
  pkgs,
  ...
}:
with pkgs;
[
  curl
  duti
  ffmpeg
  ffmpegthumbnailer
  fmt
  gh
  glow
  imagemagick
  iproute2mac
  jq
  lazygit
  librsvg
  mas
  opencv4
  openssl
  poppler
  readline
  resvg
  ripgrep
  rsync
  sqlite
  starship
  supabase-cli
  tesseract
  tldr
  trash-cli
  vivid
  wget
  yadm
  yazi
  yq
  zerotierone

  # Fucking Stupid Python
  # Use python313Full to ensure pip is installed with the correct Python version
  (pkgs.python313Full.withPackages (
    ps: with ps; [
      numpy
      opencv-python
      pdf2image
      pillow
      pip
      pytesseract
      setuptools
      wheel
    ]
  ))

  # GUI Apps
  alt-tab-macos
  chatgpt
  # goku
  google-chrome
  iina
  insomnia
  # karabiner-elements
  obsidian
  raycast
  tableplus
  zoom-us

  # Editors
  code-cursor
  neovim
  # vscode
  windsurf

  # Language Tools
  claude-code
  deno
  dotnet-sdk
  esbuild
  lua
  luajit
  nodejs_24
  pnpm
  typescript

  # Language Formatters
  dprint
  kdlfmt
  nixfmt-rfc-style
  prettier
  prettierd

  # Language Servers
  astro-language-server
  bash-language-server
  dockerfile-language-server-nodejs
  lua-language-server
  markdown-oxide
  marksman
  nil
  nixd
  ruff
  shellcheck
  sqls
  stylua
  svelte-language-server
  tailwindcss-language-server
  taplo
  tree-sitter
  typescript-language-server
  typos-lsp
  uwu-colors
  vscode-langservers-extracted
  yaml-language-server

  # Terminal Emulators
  # ghostty # Currently marked as broken
  # kitty # Don't need this if Ghostty isn't installed - only used for image display in Ghostty
  # wezterm # Installed via home-manager configuration
]
