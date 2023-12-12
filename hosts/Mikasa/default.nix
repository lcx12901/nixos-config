{ username, nixpkgs, pkgs, ...}:
{

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";
  
  i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    # LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    # LC_TIME = "zh_CN.UTF-8";
    LANG = "zh_CN.UTF-8";
  };

  networking.hostName = "Mikasa";

  systemd.tmpfiles.rules = [
    "d /home/${username}/.config 0755 ${username} users"
  ];

  environment.systemPackages = with pkgs; [
    wget
  ];

  environment.enableAllTerminfo = true;

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  users.mutableUsers = false;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    hashedPassword = "$6$XXUp9uRF41kC5YHm$lsOLgDuECYb9CbDHBRpsPashoBzB794KoLWI2NCpOl5cB9puDosikhJwGXNxuLf/mW6nJ0SdYkasIAIHfd99/0";
  };

  programs.nix-ld.enable = true;

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = username;
    startMenuLaunchers = true;

    extraBin = with pkgs; [
      { src = "${coreutils}/bin/uname"; }
      { src = "${coreutils}/bin/dirname"; }
      { src = "${coreutils}/bin/readlink"; }
    ];

    nativeSystemd = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;
  };

  # WSL 比其他任何东西都更接近容器
  boot.isContainer = true;

  environment.etc.hosts.enable = false;
  environment.etc."resolv.conf".enable = false;

  networking.dhcpcd.enable = false;

  nix = {
    settings = {
      trusted-users = [username];

      accept-flake-config = true;
      auto-optimise-store = true;
    };

    package = pkgs.nixFlakes;
    extraOptions = ''experimental-features = nix-command flakes'';

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  # Disable systemd units that don't make sense on WSL
  systemd.services."serial-getty@ttyS0".enable = false;
  systemd.services."serial-getty@hvc0".enable = false;
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@".enable = false;

  systemd.services.firewall.enable = false;
  systemd.services.systemd-resolved.enable = false;
  systemd.services.systemd-udevd.enable = false;

  # Don't allow emergency mode, because we don't have a console.
  systemd.enableEmergencyMode = false;


  system.stateVersion = "23.05";
}
