{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    extraConfig = ''
      identitiesOnly yes
      AddKeysToAgent yes
    '';
  };
}
