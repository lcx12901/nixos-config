{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  name = "mihomo-meta";
  version = "91a7ffaad2d78b3fcb4936f999236fc3fa8ce210";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-tjcD4nFiHfIjxe3i/Us6DefYO5xXbZbO11LmuoiUGeM=";
  };

  vendorHash = "sha256-bcaNTPtoCkvmPvvj50rE3539+ux3LcLbrR9CVBysL6I=";

  # Do not build testing suit
  excludedPackages = ["./test"];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=alpha-91a7ffa"
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
