{ stdenvNoCC, fetchzip }:
let
  harmonyos-sans = fetchzip {
    url = "https://developer.huawei.com/images/download/next/HarmonyOS-Sans-v3.zip";
    sha256 = "";
    stripRoot = false;
  };
in
stdenvNoCC.mkDerivation {
  name = "harmonyos-sans";
  src = harmonyos-sans;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/truetype
    cp -r $src/* $out/share/fonts/truetype/
    runHook postInstall
  '';
}
