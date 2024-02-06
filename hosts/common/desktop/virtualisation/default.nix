{pkgs, ...}: {
  boot.kernelModules = ["vfio-pci"];

  boot.extraModprobeConfig = "options kvm_amd nested=1";

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.runAsRoot = true;
    };
    lxd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu_kvm
    qemu
  ];
}
