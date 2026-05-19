{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-configtool
      fcitx5-gtk
      fcitx5-rime
      rime-ice
    ];
  };

  home.file.".local/share/fcitx5/rime/default.custom.yaml".source = ./default.custom.yaml;
}
