{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # google translate
      "fjjopahebfkmlmkekebhacaklbhiefbn" # vue devtool beta
      "gcalenpjmijncebpfijmoaglllgpjagf" # tampermonkey
    ];
  };
}