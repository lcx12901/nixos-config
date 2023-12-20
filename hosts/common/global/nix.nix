{ pkgs, ... }: {
  nix = {
    settings = {
      trusted-users = ["root" "@wheel"];
      accept-flake-config = true;
      # 使 nix 在每次构建（对于构建路径）后优化存储
      auto-optimise-store = true;
      warn-dirty = false;
    };
    # nix.optimise.automatic 设置一个 systemd 计时器，定期检查所有路径并优化它们。默认情况下，每天发生一次，可以自定义配置计划
    optimise.automatic = true;
    package = pkgs.nixFlakes;
    extraOptions = ''experimental-features = nix-command flakes'';
    gc = {
      automatic = true;
      dates = "weekly";
      # Keep the last 3 generations
      options = "--delete-older-than 7d";
    };
  };
}
