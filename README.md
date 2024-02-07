## nixOS Config

### Upgrading NixOS

```nix
nix flake lock --update-input <input name>  # update single flake input
sudo nixos-rebuild boot --flake .#desktop
```