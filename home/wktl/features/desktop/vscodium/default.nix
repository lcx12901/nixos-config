{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "tokyo-night";
        publisher = "enkia";
        version = "1.0.6";
        sha256 = "sha256-VWdUAU6SC7/dNDIOJmSGuIeffbwmcfeGhuSDmUE7Dig=";
      }
      {
        name = "vscode-icons";
        publisher = "vscode-icons-team";
        version = "12.7.0";
        sha256 = "sha256-q0PS5nSQNx/KUpl+n2ZLWtd3NHxGEJaUEUw4yEB7YPA=";
      }
      {
        name = "indent-rainbow";
        publisher = "oderwat";
        version = "8.3.1";
        sha256 = "sha256-dOicya0B2sriTcDSdCyhtp0Mcx5b6TUaFKVb0YU3jUc=";
      }
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.2.2";
        sha256 = "sha256-jwOM+6LnHyCkvhOTVSTUZvgx77jAg6hFCCpBqY8AxIg=";
      }
      {
        name = "volar";
        publisher = "Vue";
        version = "1.8.27";
        sha256 = "sha256-6FktlAJmOD3dQNn2TV83ROw41NXZ/MgquB0RFQqwwW0=";
      }
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1829";
        sha256 = "sha256-wNEM24cplm/FHsDu30EiFpVrZWDCqGkNQdxHEjfFip0=";
      }
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "14.7.0";
        sha256 = "sha256-vtI+d/UhiAhREe0Hf5mGubhPoS+UPqha1hRFpnx2yR0=";
      }
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

      "gitlens.ai.experimental.provider" = "openai";
    };
  };
}
