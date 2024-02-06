{pkgs, ...}: {
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
    # 查询当前可用的所有历史版本
    # nix profile history --profile /nix/var/nix/profiles/system
    # 清理 7 天之前的所有历史版本
    # sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system
    # 清理历史版本并不会删除数据，还需要手动 gc 下
    # sudo nix store gc --debug
    gc = {
      automatic = true;
      dates = "daily";
      # Keep the last 3 generations
      options = "--delete-older-than 7d";
    };
  };
}
