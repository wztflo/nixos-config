{ config, pkgs, ... }: {
  
  imports = [
    ./core
    ./plugin
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true; 
  };
}