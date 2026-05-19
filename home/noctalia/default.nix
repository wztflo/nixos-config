{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      wallpaper = {
        directory = "/home/wztflo/Pictures/Wallpapers";
        overviewEnabled = true;
      };

      general = {
        lockOnSuspend = true;
        enableShadows = false;
      };

      colorSchemes = {
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
      };

      bar = {
        position = "top";
        density = "default";
        showCapsule = true;
        outerCorners = false;
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "Clock"; }
            { id = "ActiveWindow"; }
          ];
          center = [
            { id = "Workspace"; }
          ];
          right = [
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            { id = "Battery"; }
            { id = "Volume"; }
            { id = "ControlCenter"; }
          ];
        };
      };

      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide";
        dockType = "floating";
      };
    };

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        polkit-agent = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        niri-workspaces = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };
  };

  # Copy wallpaper files to ~/Pictures/Wallpapers/
  home.file = {
    "Pictures/Wallpapers/a.png".source = ../../_img/Wallpapers/a.png;

    # Set a.png as the default wallpaper
    ".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "/home/wztflo/Pictures/Wallpapers/a.png";
        wallpapers = { };
      };
    };
  };
}
