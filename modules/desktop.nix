{ pkgs, ... }:

{
  services.xserver.enable = false;
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  # programs.xwayland.enable = true;
  security.polkit.enable = true;
  programs.niri.useNautilus = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
      };
    };
  };
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    # ... other packages
  ];
}
