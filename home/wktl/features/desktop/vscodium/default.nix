{
  pkgs,
  nix-vscode-extensions,
  ...
}: let
  extensions = nix-vscode-extensions.extensions.${pkgs.system};
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions =
      (with extensions.vscode-marketplace; [
        ms-ceintl.vscode-language-pack-zh-hans
        enkia.tokyo-night
        vscode-icons-team.vscode-icons
        oderwat.indent-rainbow
        wix.vscode-import-cost
        streetsidesoftware.code-spell-checker
        usernamehw.errorlens
        dbaeumer.vscode-eslint
        kamikillerto.vscode-colorize
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        eamodio.gitlens
      ])
      ++ (with extensions.open-vsx; [
        kamadorueda.alejandra
        vue.volar
      ]);

    userSettings = {
      "update.mode" = "none";
      "extensions.autoUpdate" = false;
      "vsicons.dontShowNewVersionMessage" = true;

      "workbench.colorTheme" = "Tokyo Night Storm";
      "workbench.iconTheme" = "vscode-icons";

      "editor.fontSize" = 17;
      "editor.fontLigatures" = true;
      "editor.cursorBlinking" = "smooth";
      "editor.tabSize" = 2;
      "editor.lineNumbers" = "relative";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
      "editor.codeLensFontFamily" = "'JetBrainsMono Nerd Font'";
      "scm.inputFontFamily" = "'JetBrainsMono Nerd Font'";

      "window.zoomLevel" = 1;
      "window.titleBarStyle" = "custom";

      "files.autoSave" = "onWindowChange";

      "git.autofetch" = true;

      "terminal.integrated.inheritEnv" = true;
      "terminal.integrated.gpuAcceleration" = "on";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.enableImages" = true;
      "terminal.integrated.smoothScrolling" = true;
      "terminal.external.lincxExec" = "kitty";

      "gitlens.ai.experimental.provider" = "openai";

      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
      };
      "alejandra.program" = "alejandra";

      "cSpell.userWords" = [
        "nixos"
      ];
    };
  };
}
