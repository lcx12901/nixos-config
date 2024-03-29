{
  stdenvNoCC,
  fetchurl,
  nix-update-script,
}:
stdenvNoCC.mkDerivation rec {
  pname = "clash-geoip";
  version = "20240312";

  src = fetchurl {
    url = "https://github.com/Dreamacro/maxmind-geoip/releases/download/${version}/Country.mmdb";
    sha256 = "sha256-h6nrlzFBRrvL+hUOnpWi/aixKDOlRoTV4zQYIHGslIY=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/etc/mihomo
    install -Dm 0644 $src -D $out/etc/mihomo/Country.mmdb
    runHook postInstall
  '';

  passthru = {
    updateScript = nix-update-script {};
  };
}
