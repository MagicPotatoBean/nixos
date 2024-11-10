{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "desktop"; # Define your hostname.
  services.logind.lidSwitchExternalPower = "ignore";
  services.octoprint.enable = true;
}
