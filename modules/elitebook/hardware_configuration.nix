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

  boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e31cfb87-1aaa-49a8-a9b3-5f374bf9f7c6";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-b0b0caa1-d830-41db-86d7-e19ec793790f".device = "/dev/disk/by-uuid/b0b0caa1-d830-41db-86d7-e19ec793790f";
  boot.initrd.luks.devices."luks-20ad34fc-0011-4ae0-8e39-c47cefa8debe".device = "/dev/disk/by-uuid/20ad34fc-0011-4ae0-8e39-c47cefa8debe";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7B92-2D47";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/7db25a9c-242b-4f00-98fd-952ac30cdb1a";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp58s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
