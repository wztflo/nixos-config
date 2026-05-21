{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    nano
    wget
  ];

  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };

}
