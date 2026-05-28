{ pkgs, ... }:
let
  harmonyos-sans = pkgs.callPackage ../fonts { };
in
{
  imports = [
    ./fcitx5
    ./ghostty
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "HarmonyOS Sans SC"
        "HarmonyOS Sans"
      ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };

  home.packages = with pkgs; [
    ghostty
    flclash
    localsend
    google-chrome
    zed-editor
    harmonyos-sans
    nerd-fonts.jetbrains-mono
  ];
}
