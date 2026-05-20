{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../modules/system.nix
  ];

  networking.hostName = "nixos-wsl";

  wsl.enable = true;
  wsl.defaultUser = "wztflo";
  wsl.interop.register = true;

  #vscode-remote 需要
  environment.systemPackages = [
    pkgs.wget
  ];
  programs.nix-ld.enable = true;

  system.stateVersion = "26.05";
}
