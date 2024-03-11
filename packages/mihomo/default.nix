{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  name = "mihomo-meta";
  version = "7ad37ca0e30550038d8fd62ce662969194365215";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-sCzjKEmjFeFQtR3L8ni8FvHfNT9osHoHEcsSJeDkP6w=";
  };

  vendorHash = "sha256-HxdO7QVIBs1YbQAPoiR8HPNwDwDdJClv4z/N5X5gUDI=";

  # Do not build testing suit
  excludedPackages = ["./test"];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=alpha-7ad37ca"
  ];

  tags = [
    "with_gvisor"
  ];

  # Network required
  doCheck = false;

  postInstall = ''
    mv $out/bin/mihomo $out/bin/mihomo-meta
  '';
}
