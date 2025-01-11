{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "desktop"; # Define your hostname.
  services = {
    octoprint.enable = true;
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
      };
    };
    fail2ban = {
      enable = true;
      maxretry = 3;
      ignoreIP = [
        "192.168.0.0/16"
      ];
    };
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs = {
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    # Enable steam
    steam.enable = true;
  };

  environment.systemPackages = [
    pkgs.bambu-studio
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
