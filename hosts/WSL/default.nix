{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../modules/system.nix
    ../../modules/pkgs.nix
  ];

  networking.hostName = "nixos-wsl";

  wsl.enable = true;
  wsl.defaultUser = "wztflo";
  wsl.interop.register = true;

  #vscode-remote 需要
  programs.nix-ld.enable = true;

  system.stateVersion = "26.05";
}
