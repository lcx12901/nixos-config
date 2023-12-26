{
  imports = [
    ./locale.nix
    ./nix.nix
    ./nix-ld.nix
    ./timeZone.nix
    ./fish.nix
  ];

  # ssh-agent is used to pull my private secrets repo from github when depoloying my nixos config.
  programs.ssh.startAgent = true;
}