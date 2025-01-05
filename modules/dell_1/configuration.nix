{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "dell_1"; # Define your hostname.
  services.logind.lidSwitchExternalPower = "ignore";
  # Add new CA certificates
  security.pki.certificates = [
    ''      SFCF
      =========
      -----BEGIN CERTIFICATE-----
      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
      -----END CERTIFICATE-----''
    ''      Smoothwall
      =========
      -----BEGIN CERTIFICATE-----
      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
      ntNGe+V1+s6MhuJGs8Dyd6pqOi+ki5u2SY59mw==
      -----END CERTIFICATE-----''
  ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
