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
  environment.systemPackages = [
    pkgs.prusa-slicer
    pkgs.lutris
    pkgs.vesktop
    pkgs.gimp
    pkgs.gnomeExtensions.gsnap
    pkgs.prismlauncher
    pkgs.jdk17_headless
    pkgs.jdk21_headless
    pkgs.modrinth-app
    pkgs.krita
  ];
}
