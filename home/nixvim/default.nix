{ config, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lz-n.enable = true;

    imports = [
      ./core
      ./plugin
    ];
  };
}
