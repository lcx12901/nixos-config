{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      enkia.tokyo-night
      mhutchie.git-graph
      oderwat.indent-rainbow
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      vscode-icons-team.vscode-icons
      wix.vscode-import-cost
      dbaeumer.vscode-eslint
      bbenoist.nix
      rust-lang.rust-analyzer
    ];

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

      "window.zoomLevel" = 0.5;
      "window.titleBarStyle" = "custom";

      "files.autoSave" = "onWindowChange";

      "git.autofetch" = true;

      "terminal.integrated.inheritEnv" = true;
      "terminal.integrated.gpuAcceleration" = "on";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.enableImages" = true;
      "terminal.integrated.smoothScrolling" = true;
      "terminal.external.lincxExec" = "kitty";
    };
  };
}
