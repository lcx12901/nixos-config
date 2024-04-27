{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        mouse = false;
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
    languages = with pkgs; {
      language-server = {
        typescript-language-server = with nodePackages_latest; {
          command = "${typescript-language-server}/bin/typescript-language-server";
          args = ["--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib"];
          config.documentFormatting = false;
        };
      };
    };
  };
}
