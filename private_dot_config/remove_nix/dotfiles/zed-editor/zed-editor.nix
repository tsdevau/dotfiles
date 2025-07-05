{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = false;
  package = pkgs.zed-editor;
  extensions = [
    "astro"
    "catppuccin-icons"
    "catppuccin"
    "code-stats"
    "html"
    "kdl"
    "lua"
    "markdown-oxide"
    "marksman"
    "mcp-server-context7"
    "nix"
    "svelte"
    "typos"
  ];

  userKeymaps = [
    {
      context = "Workspace";
      bindings = {
        "cmd-[" = "workspace::ActivatePreviousPane";
        "cmd-]" = "workspace::ActivateNextPane";
        "cmd-shift-g" = "git_panel::ToggleFocus";
        "ctrl-shift-g" = null;
      };
    }
    {
      context = "Workspace > RightDock";
      bindings = {
        "cmd-l" = "workspace::ToggleRightDock";
      };
    }
    {
      context = "Editor && !AgentPanel";
      bindings = {
        "cmd-l" = "agent::ToggleFocus";
      };
    }
    {
      context = "Editor";
      use_key_equivalents = true;
      bindings = {
        "cmd-shift-k" = "editor::DeleteLine";
        "ctrl-v" = "editor::ToggleSelectionMenu";
        "cmd-l" = null;
        "cmd-[" = "workspace::ActivatePreviousPane";
        "cmd-]" = "workspace::ActivateNextPane";
      };
    }
    {
      context = "ContextEditor > Editor";
      use_key_equivalents = true;
      bindings = {
        "cmd-shift-g" = "git_panel::ToggleFocus";
      };
    }
    {
      context = "Pane";
      use_key_equivalents = true;
      bindings = {
        "cmd-shift-g" = "git_panel::ToggleFocus";
      };
    }
    {
      context = "vim_mode == helix_normal && !menu";
      bindings = {
        "cmd-shift-g" = "git_panel::ToggleFocus";
        "g h" = [
          "editor::MoveToBeginningOfLine"
          {
            stop_at_soft_wraps = true;
            stop_at_indent = true;
          }
        ];
        "g s" = [
          "editor::MoveToBeginningOfLine"
          {
            stop_at_soft_wraps = true;
            stop_at_indent = true;
          }
        ];
        "shift-z shift-q" = [
          "pane::CloseActiveItem"
          { save_intent = "skip"; }
        ];
        "shift-z shift-z" = [
          "pane::CloseActiveItem"
          { save_intent = "save_all"; }
        ];
        "z b" = "editor::ScrollCursorBottom";
        "z t" = "editor::ScrollCursorTop";
        "z z" = "editor::ScrollCursorCenter";
      };
    }
    {
      context = "vim_mode == insert";
      bindings = {
        "j k" = "vim::HelixNormalAfter";
      };
    }
  ];

  userSettings = {
    auto_signature_help = true;
    auto_update = true;
    base_keymap = "VSCode";
    buffer_font_family = "MesloLGM Nerd Font Mono";
    buffer_font_size = 16;
    cursor_shape = "bar";
    experimental.theme_overrides = {
      background = "#1e1e2e99";
      "background.appearance" = "transparent";
      editor.active_line.background = "#9399b226";
      editor.background = "#18182555";
      editor.document_highlight.bracket_background = "#f5e0dc22";
      editor.gutter.background = "#1e1e2e55";
      editor.subheader.background = "#18182555";
      panel.background = "#18182555";
      surface.background = "#18182555";
      tab.active_background = "#313244";
      tab.inactive_background = "#18182508";
      tab_bar.background = "#11111b55";
      terminal.background = "#1818250c";
      toolbar.background = "#1e1e2e5f";
    };
    features.edit_prediction_provider = "copilot";
    file_scan_inclusions = [ ];
    git = {
      git_gutter = "tracked_files";
      gutter_debounce = 1000;
      hunk_style = "unstaged_hollow";
      inline_blame.delay_ms = 300;
    };
    git_panel = {
      default_width = 480;
      dock = "right";
      sort_by_path = true;
    };
    icon_theme = "Catppuccin Mocha";
    indent_guides = {
      background_coloring = "indent_aware";
      coloring = "indent_aware";
    };
    journal.hour_format = "hour24";
    notification_panel = {
      dock = "right";
      default_width = 300;
    };
    outline_panel = {
      dock = "right";
      default_width = 300;
    };
    preferred_line_length = 120;
    prettier = {
      allowed = true;
      printWidth = 120;
      semi = false;
      singleAttributePerLine = true;
    };
    project_panel = {
      dock = "right";
      default_width = 300;
      indent_guides.show = "always";
    };
    read_ssh_config = true;
    restore_on_startup = "last_session";
    show_signature_help_after_edits = true;
    search.include_ignored = false;
    tab_size = 2;
    tabs = {
      close_position = "left";
      file_icons = true;
      git_status = true;
      show_diagnostics = "all";
    };
    telemetry = {
      diagnostics = true;
      metrics = false;
    };
    terminal = {
      cursor_shape = "bar";
      option_as_meta = true;
      blinking = "on";
      detect_venv.on.directories = [
        ".venv"
        "venv"
      ];
      line_height = "standard";
    };
    theme = {
      dark = "Catppuccin Mocha";
      light = "Catppuccin Mocha";
      mode = "dark";
    };
    ui_font_family = "Helvetica Neue";
    ui_font_size = 16;
    vim = {
      cursor_shape = {
        insert = "bar";
        normal = "block";
        visual = "bar";
        replace = "block";
      };
      default_mode = "helix_normal";
      toggle_relative_line_numbers = true;
      use_smartcase_find = true;
      use_system_clipboard = "always";
    };
    vim_mode = true;
    use_smartcase_search = true;
    wrap_guides = [
      80
      120
    ];

    lsp.uwu_colors.settings.uwu_colors = {
      variable-completions = true;
      named-completions-mode = "lower";
      color-collection = "colorhexa";
    };

    languages = {
      Astro = {
        language_servers = [
          "astro-language-server"
          "uwu_colors"
          "..."
        ];
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [
            "prettier-plugin-astro"
            "prettier-plugin-packagejson"
          ];
        };
      };
      JavaScript = {
        language_servers = [
          "!typescript-language-server"
          "vtsls"
          "uwu_colors"
          "..."
        ];
        preferred_line_length = 120;
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-packagejson" ];
        };
      };
      JSX = {
        language_servers = [
          "!typescript-language-server"
          "vtsls"
          "uwu_colors"
          "..."
        ];
        preferred_line_length = 120;
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-packagejson" ];
        };
      };
      JSON = {
        language_servers = [
          "json-language-server"
          "uwu_colors"
          "..."
        ];
        preferred_line_length = 120;
        format_on_save = "on";
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-packagejson" ];
        };
      };
      JSONC = {
        language_servers = [
          "json-language-server"
          "uwu_colors"
          "..."
        ];
        preferred_line_length = 120;
        format_on_save = "on";
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
        };
      };
      Lua = {
        language_servers = [
          "lua-language-server"
          "uwu_colors"
          "..."
        ];
        format_on_save = "on";
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "@prettier/plugin-lua" ];
        };
      };
      Markdown = {
        allow_rewrap = "anywhere";
        format_on_save = "on";
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
        };
        soft_wrap = "editor_width";
        use_on_type_format = false;
      };
      PHP = {
        language_servers = [
          "!phpactor"
          "intelephense"
          "..."
        ];
        prettier = {
          allowed = true;
          parser = "php";
          plugins = [ "@prettier/plugin-php" ];
        };
      };
      Svelte = {
        language_servers = [
          "svelte-language-server"
          "uwu_colors"
          "..."
        ];
        format_on_save = "on";
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [
            "prettier-plugin-svelte"
            "prettier-plugin-packagejson"
          ];
        };
      };
      TOML = {
        language_servers = [
          "taplo"
          "uwu_colors"
          "..."
        ];
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-toml" ];
        };
      };
      TSX = {
        language_servers = [
          "!typescript-language-server"
          "vtsls"
          "uwu_colors"
          "..."
        ];
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-packagejson" ];
        };
      };
      TypeScript = {
        language_servers = [
          "!typescript-language-server"
          "vtsls"
          "uwu_colors"
          "..."
        ];
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-packagejson" ];
        };
      };
      YAML = {
        language_servers = [
          "yaml-language-server"
          "uwu_colors"
          "..."
        ];
        formatter.external = {
          command = "dprint";
          arguments = [
            "fmt"
            "--config"
            "~/.config/dprint/dprint.json"
            "--stdin"
            "{buffer_path}"
          ];
        };
        prettier = {
          allowed = true;
        };
      };
    };

    agent = {
      always_allow_tool_actions = false;
      button = true;
      default_height = 320;
      default_model = {
        model = "gemini-2.5-pro";
        provider = "copilot_chat";
      };
      default_width = 640;
      dock = "left";
      preferred_completion_mode = "normal";
      model_parameters = [ { temperature = 0.1; } ];
      profiles = {
        ask = {
          enable_all_context_servers = true;
          name = "Ask";
          tools = {
            contents = true;
            diagnostics = true;
            fetch = true;
            find_path = true;
            grep = true;
            list_directory = true;
            now = true;
            open = true;
            read_file = true;
            thinking = true;
            web_search = true;
          };
        };
        minimal = {
          enable_all_context_servers = false;
          name = "Minimal";
          tools = { };
        };
        write = {
          enable_all_context_servers = true;
          name = "Write";
          tools = {
            copy_path = true;
            create_directory = true;
            create_file = true;
            delete_path = true;
            diagnostics = true;
            edit_file = true;
            fetch = true;
            find_path = true;
            grep = true;
            list_directory = true;
            move_path = true;
            now = true;
            open = true;
            read_file = true;
            rename_path = true;
            run_script = true;
            thinking = true;
          };
        };
      };
      single_file_review = false;
      stream_edits = false;
      version = "2";
    };
  };
}
