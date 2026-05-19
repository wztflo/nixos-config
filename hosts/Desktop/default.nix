{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/desktop.nix
    ../../modules/hardware.nix
    ../../modules/boot.nix
  ];

  networking.hostName = "nixos-desktop";
  networking.networkmanager.enable = true;
  users.users.wztflo.extraGroups = [ "networkmanager" ];

  system.stateVersion = "26.05";
}
