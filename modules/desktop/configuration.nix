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
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  # Enable steam
  steam.enable = true;
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
    pkgs.qemu
    pkgs.quickemu
    pkgs.spotify
    pkgs.cargo-tauri
    pkgs.trunk
  ];
}
