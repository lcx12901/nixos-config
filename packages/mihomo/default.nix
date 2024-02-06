{ fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "mihomo-meta";
  version = "20658f6eac2b9fb876b377547ee0190eb2e57b05";

  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-BAsCtgy9lAE6DWF7LpVeyzq/uOZqpnfl8gjK+479tu4=";
  });

  vendorHash = "sha256-tvPR5kAta4MlMTwjfxwVOacRr2nVpfalbN08mfxml64=";

  # Do not build testing suit
  excludedPackages = [ "./test" ];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=alpha-20658f6"
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