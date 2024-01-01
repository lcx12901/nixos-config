{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ddns-go
  ];
}