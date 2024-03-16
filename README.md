## nixOS Config

### Upgrading NixOS

```nix
nix flake lock --update-input <input name>  # update single flake input
sudo nixos-rebuild <switch | boot> --flake .#desktop
sudo nix-store --repair --verify --check-contents  # Fix errors caused by unexpected flake abort
```
