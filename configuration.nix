{ config, modulesPath, pkgs, lib, ... }:
{
    imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
        ./lima-init.nix
    ];

    # ssh
    services.openssh.enable = true;
    #services.openssh.permitRootLogin = "yes";
    services.openssh.settings.PermitRootLogin = "yes";
    users.users.root.password = "nixos";

    security = {
        sudo.wheelNeedsPassword = false;
    };

    # system mounts
    boot.loader.grub = {
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = true;
    };
    fileSystems."/boot" = {
        device = "/dev/disk/by-label/ESP";  # /dev/disk/by-label/ESP
        fsType = "vfat";
    };
    fileSystems."/" = {
        device = "/dev/disk/by-label/nixos";
        autoResize = true;
        fsType = "ext4";
        options = [ "noatime" "nodiratime" "discard" ];
    };

    # misc
    boot.kernelPackages = pkgs.linuxPackages_latest;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # pkgs
    environment.systemPackages = with pkgs; [
        vim
    ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.11"; # Did you read the comment?
}
