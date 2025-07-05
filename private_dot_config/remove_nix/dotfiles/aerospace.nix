{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = false; # Disabled while testing other window managers
  package = pkgs.aerospace;
  userSettings = {
    # Startup and login commands
    after-login-command = [ ];
    after-startup-command = [ ];
    start-at-login = true;

    # Notification settings
    exec-on-workspace-change = [ ];

    # Normalisation settings
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;

    # Layout settings
    accordion-padding = 0;
    default-root-container-layout = "tiles";
    default-root-container-orientation = "auto";

    # Focus behaviour
    on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
    automatically-unhide-macos-hidden-apps = false;

    # Key mapping
    key-mapping = {
      preset = "qwerty";
    };

    # Gaps configuration
    gaps = {
      inner = {
        horizontal = 16;
        vertical = 16;
      };
      outer = {
        left = 16;
        bottom = 16;
        top = 16;
        right = 16;
      };
    };

    # Window detection rules
    on-window-detected = [
      # Floating layout apps
      {
        "if" = {
          app-id = "com.stairways.keyboardmaestro.editor";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.apple.finder";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.apple.MobileSMS";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.apple.Preview";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.1password.1password";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.openai.chat";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.anthropic.claudefordesktop";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.sbs.diet";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.apple.iCal";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.apple.reminders";
        };
        run = [ "layout floating" ];
      }
      {
        "if" = {
          app-id = "com.p5sys.jump.mac.viewer.web";
        };
        run = [ "layout floating" ];
      }

      # Development workspace apps
      {
        "if" = {
          app-id = "com.exafunction.windsurf";
        };
        run = [ "move-node-to-workspace Development --focus-follows-window" ];
      }
      {
        "if" = {
          app-id = "com.microsoft.VSCode";
        };
        run = [ "move-node-to-workspace Development --focus-follows-window" ];
      }
      {
        "if" = {
          app-id = "com.todesktop.230313mzl4w4u92";
        };
        run = [ "move-node-to-workspace Development --focus-follows-window" ];
      }
      {
        "if" = {
          app-id = "com.zed.Zed";
        };
        run = [ "move-node-to-workspace Development --focus-follows-window" ];
      }

      # Web workspace apps
      {
        "if" = {
          app-id = "com.apple.Safari";
        };
        run = [ "move-node-to-workspace Web --focus-follows-window" ];
      }
      {
        "if" = {
          app-id = "com.google.Chrome";
        };
        run = [ "move-node-to-workspace Web --focus-follows-window" ];
      }

      # Utilities workspace apps
      {
        "if" = {
          app-id = "com.microsoft.Excel";
        };
        run = [
          "layout tiling"
          "move-node-to-workspace Utilities --focus-follows-window"
        ];
      }
      {
        "if" = {
          app-id = "com.microsoft.Word";
        };
        run = [
          "layout tiling"
          "move-node-to-workspace Utilities --focus-follows-window"
        ];
      }
      {
        "if" = {
          app-id = "com.dygmalab.bazecor";
        };
        run = [
          "layout tiling"
          "move-node-to-workspace Utilities --focus-follows-window"
        ];
      }

      # Camera workspace apps
      {
        "if" = {
          app-id = "com.colliderli.iina";
        };
        run = [
          "layout floating"
          "move-node-to-workspace Cameras --focus-follows-window"
        ];
      }
    ];

    # Mode bindings
    mode = {
      main = {
        binding = {
          # Layout commands
          "ctrl-alt-shift-slash" = "layout tiles horizontal vertical";
          "ctrl-alt-shift-comma" = "layout accordion horizontal vertical";
          "ctrl-alt-shift-f" = "layout floating tiling";

          # Focus commands
          "ctrl-alt-shift-h" = "focus left";
          "ctrl-alt-shift-j" = "focus down";
          "ctrl-alt-shift-k" = "focus up";
          "ctrl-alt-shift-l" = "focus right";

          # Move commands
          "cmd-ctrl-alt-shift-h" = "move left";
          "cmd-ctrl-alt-shift-j" = "move down";
          "cmd-ctrl-alt-shift-k" = "move up";
          "cmd-ctrl-alt-shift-l" = "move right";

          # Resize commands
          "ctrl-alt-shift-minus" = "resize smart -50";
          "ctrl-alt-shift-equal" = "resize smart +50";

          # Workspace commands
          "ctrl-alt-shift-1" = "workspace Home";
          "ctrl-alt-shift-c" = "workspace Cameras";
          "ctrl-alt-shift-d" = "workspace Development";
          "ctrl-alt-shift-w" = "workspace Web";
          "ctrl-alt-shift-m" = "workspace Mail";
          "ctrl-alt-shift-s" = "workspace Spare";
          "ctrl-alt-shift-t" = "workspace Terminal";
          "ctrl-alt-shift-u" = "workspace Utilities";

          # Move to workspace commands
          "cmd-ctrl-alt-shift-1" = "move-node-to-workspace Home --focus-follows-window";
          "cmd-ctrl-alt-shift-c" = "move-node-to-workspace Cameras --focus-follows-window";
          "cmd-ctrl-alt-shift-d" = "move-node-to-workspace Development --focus-follows-window";
          "cmd-ctrl-alt-shift-w" = "move-node-to-workspace Web --focus-follows-window";
          "cmd-ctrl-alt-shift-m" = "move-node-to-workspace Mail --focus-follows-window";
          "cmd-ctrl-alt-shift-s" = "move-node-to-workspace Spare --focus-follows-window";
          "cmd-ctrl-alt-shift-t" = "move-node-to-workspace Terminal --focus-follows-window";
          "cmd-ctrl-alt-shift-u" = "move-node-to-workspace Utilities --focus-follows-window";

          # Other commands
          "ctrl-alt-shift-tab" = "focus-back-and-forth";
          "cmd-ctrl-alt-shift-semicolon" = "mode service";
        };
      };

      service = {
        binding = {
          "esc" = [
            "reload-config"
            "mode main"
          ];
          "backspace" = [
            "close-all-windows-but-current"
            "mode main"
          ];
          "r" = [
            "flatten-workspace-tree"
            "mode main"
          ];
          "f" = [
            "layout floating tiling"
            "mode main"
          ];

          "cmd-ctrl-alt-shift-h" = [
            "join-with left"
            "mode main"
          ];
          "cmd-ctrl-alt-shift-j" = [
            "join-with down"
            "mode main"
          ];
          "cmd-ctrl-alt-shift-k" = [
            "join-with up"
            "mode main"
          ];
          "cmd-ctrl-alt-shift-l" = [
            "join-with right"
            "mode main"
          ];

          "down" = "volume down";
          "up" = "volume up";
          "shift-down" = [
            "volume set 0"
            "mode main"
          ];
        };
      };
    };
  };
}
