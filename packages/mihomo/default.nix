{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  name = "mihomo-meta";
  version = "b3db113b1b656ed6de36f643e44f10945f142da6";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "mihomo";
    # 对应的 commit 或者 tag，注意 fetchFromGitHub 不能跟随 branch！
    rev = "${version}";

    hash = "sha256-In2SDXVoi3xrDxvljQzsFm2Ax1nzXw8082ianZPOIms=";
  };

  vendorHash = "sha256-n8ZhqPeGp2KaBQaZChQ6plm2KYREniY+CWFzarkJXv0=";

  # Do not build testing suit
  excludedPackages = ["./test"];

  CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=alpha-b3db113"
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
