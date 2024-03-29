{pkgs, ...}: {
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  xdg.configFile."pnpm/rc".text = ''
    cache-dir=/home/wktl/Coding/.pnpm-store/cache
    global-bin-dir=/home/wktl/Coding/.pnpm-store
    state-dir=/home/wktl/Coding/.pnpm-store/state
    global-dir=/home/wktl/Coding/.pnpm-store/global
  '';

  home.packages = with pkgs; [
    #-- nix ----- Nix 2.16 is suffering from a CVE, wait update, can use nixd
    # nil
    # rnix-lsp
    # nixd
    statix # Lints and suggestions for the nix programming language
    deadnix # Find and remove unused code in .nix source files
    alejandra # Nix Code Formatter
    #-- lua
    stylua
    lua-language-server
    #-- bash
    nodePackages.bash-language-server
    shellcheck
    shfmt
    #-- javascript/typescript --#
    nodePackages.nodejs
    nodePackages.pnpm
    yarn
    nodePackages.typescript
    nodePackages.typescript-language-server
    # HTML/CSS/JSON/ESLint language servers extracted from vscode
    nodePackages.vscode-langservers-extracted
    emmet-ls
    #-- CloudNative
    nodePackages.dockerfile-language-server-nodejs
    #-- Others
    taplo # TOML language server / formatter / validator
    nodePackages.yaml-language-server
    sqlfluff # SQL linter
    #-- Misc
    tree-sitter # common language parser/highlighter
    marksman # language server for markdown
    glow # markdown previewer

    #-- Optional Requirements:
    gdu # disk usage analyzer, required by AstroNvim
    (ripgrep.override {withPCRE2 = true;}) # recursively searches directories for a regex pattern
  ];
}
