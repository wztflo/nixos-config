{ config, pkgs, ... }:
{
  imports = [
    ../../modules/system.nix
    ../../modules/pkgs.nix
    ../../modules/boot.nix
    ../../modules/hardware.nix
    ../../modules/desktop.nix
  ];

  networking.hostName = "nixos-vm";
  networking.networkmanager.enable = true;
  users.users.wztflo.extraGroups = [ "networkmanager" ];

  services.qemuGuest.enable = true;

  system.stateVersion = "26.05";
}
