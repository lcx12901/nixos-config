{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  name = "mihomo-meta";
  version = "0c384b1e4225709d1dcec61db37dc8af0388bfa3";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-Yy/RafNl+OWNC/+T/ESoZVpJTE5oY/mEAe9FER0AbgM=";
  };

  vendorHash = "sha256-tvPR5kAta4MlMTwjfxwVOacRr2nVpfalbN08mfxml64=";

  # Do not build testing suit
  excludedPackages = ["./test"];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=alpha-0c384b1"
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
