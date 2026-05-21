{ config, pkgs, ... }:
{

  imports = [
    ./core
    ./plugin
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lz-n.enable = true;
  };
}
