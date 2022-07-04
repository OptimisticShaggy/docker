# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/323f6b5b-0663-4136-b36f-3a62b41f10a8";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1AA9-F90B";
      fsType = "vfat";
    };

  fileSystems."/mnt/dw" =
    { device = "/dev/disk/by-uuid/65577975-3b04-4fcc-86ee-bce0b9cc44af";
      fsType = "ext4";
    };

  fileSystems."/mnt/runner" =
    { device = "/dev/disk/by-uuid/ac983d6b-3ae1-4e90-ac13-687dd77f2138";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/61c49386-60a8-4041-8b98-6b9c2c6f10bc"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
