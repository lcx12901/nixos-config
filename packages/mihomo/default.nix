{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  name = "mihomo-meta";
  version = "c44949bc45a9fb34ff22f08392d382f6b82c0e9e";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-34kPpuO6hJKS5yDpnMNu88wwIrAsDm32d0TDVzPtZ/0=";
  };

  vendorHash = "sha256-DizWfcK3nznJgJZVl73q+BQtmyIuLDOHsUEkXMbZYts=";

  # Do not build testing suit
  excludedPackages = ["./test"];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=alpha-c44949b"
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
