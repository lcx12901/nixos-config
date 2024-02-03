{ fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "mihomo-meta";
  version = "e6011301b2ff85f550d646599a799d40e535eefe";

  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-1zyHsA9m1Y+9jy69laBmDnuRYQLcyzuuQ5sqLdn4Eew=";
  });

  vendorHash = "sha256-tvPR5kAta4MlMTwjfxwVOacRr2nVpfalbN08mfxml64=";

  # Do not build testing suit
  excludedPackages = [ "./test" ];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=${version}"
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