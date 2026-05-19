{ ... }:

{
  boot.kernelModules = [ "ntfs3" ];

  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
  };
  security.rtkit.enable = true;
}
