{pkgs, ...}: let
  vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
in {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/proxy.nix
    ../common/optional/systemd-boot.nix

    ../common/desktop/virtualisation
    ../common/desktop/hyprland
  ];

  # enable the i915 kernel module
  boot.initrd.kernelModules = ["i915"];
  boot.kernelParams = ["i915.fastboot=1" "enable_gvt=1"];

  # better performance than the actual Intel driver
  services.xserver.videoDrivers = ["modesetting"];

  # OpenCL support and VAAPI
  hardware.opengl = {
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  networking.hostName = "Icarus";

  networking.nameservers = ["1.1.1.1 8.8.8.8"];

  security.polkit.enable = true;

  networking.firewall.allowedTCPPortRanges = [
    {
      from = 8033;
      to = 8039;
    }
  ];

  networking.extraHosts = ''
    127.0.0.1 t3.z9soft.cn
  '';

  system.stateVersion = "23.11";
}
