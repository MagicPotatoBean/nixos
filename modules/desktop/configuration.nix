{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "desktop"; # Define your hostname.
  services.logind.lidSwitchExternalPower = "ignore";
  services.octoprint.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
