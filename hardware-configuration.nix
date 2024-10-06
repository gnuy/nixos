# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "uas" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/ea759c5e-2129-40b7-84cf-e54579ca718e";

  fileSystems."/" =
    { 
      # device = "/dev/disk/by-uuid/a4cdda92-db93-4405-aa6b-dc1821adeb7c";
      device = "/dev/disk/by-uuid/7ef38977-adc6-4389-8799-d990accc0c46";
      fsType = "ext4";
    };

  fileSystems."/nix" =
    { 
      device = "/dev/disk/by-uuid/76c2c33c-6dcc-4312-b8e4-2bd0131b42b3";
      fsType = "ext4";
    };

  fileSystems."/etc/nixos" =
    { device = "/nix/config";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4989-FCEB";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [{ 
	device = "/dev/disk/by-uuid/70d41863-dc5a-4a8c-89bf-50f5dd373de6"; 
    }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s20f0u1u2.useDHCP = lib.mkDefault true;
    networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
