{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../modules/system.nix
  ];

  networking.hostName = "nixos-wsl";

  wsl.enable = true;
  wsl.defaultUser = "wztflo";

  system.stateVersion = "26.05";
}
