# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a5e238a0-2c92-4d70-94de-237d10f00317";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F435-49EF";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/run/media/zoe/500GB Drive" = {
    device = "/dev/disk/by-uuid/2b0c5285-58b7-48b7-9519-688b47ec8c61";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/c29037ea-6190-4f5a-a7ef-dfdb1bb8bcf6";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
