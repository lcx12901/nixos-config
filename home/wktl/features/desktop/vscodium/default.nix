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
        postman.postman-for-vscode
        prisma.prisma
        philsinatra.nested-comments # 嵌套注释
        graphql.vscode-graphql
        graphql.vscode-graphql-syntax
        wallabyjs.console-ninja # 直接打印 console.log 结果
      ])
      ++ (with extensions.open-vsx; [
        kamadorueda.alejandra
        editorconfig.editorconfig
        vue.volar
        antfu.unocss
      ]);

    userSettings = {
      "update.mode" = "none";
      "extensions.autoUpdate" = false;
      "vsicons.dontShowNewVersionMessage" = true;

      "workbench.colorTheme" = "Tokyo Night Storm";
      "workbench.iconTheme" = "vscode-icons";

      "editor.fontSize" = 17;
      "editor.fontLigatures" = true;
      # 光标的动画样式
      "editor.cursorBlinking" = "smooth";
      # 启用平滑插入动画
      "editor.cursorSmoothCaretAnimation" = "on";
      # 强制执行"#光标环绕行#"
      "editor.cursorSurroundingLinesStyle" = "all";
      "editor.tabSize" = 2;
      "editor.lineNumbers" = "relative";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
      "editor.codeLensFontFamily" = "JetBrainsMono Nerd Font";
      # 启用括号对参考线
      "editor.guides.bracketPairs" = true;
      "scm.inputFontFamily" = "JetBrainsMono Nerd Font";

      "window.zoomLevel" = 1;
      "window.titleBarStyle" = "custom";

      "files.autoSave" = "onWindowChange";

      "git.autofetch" = true;

      "terminal.integrated.inheritEnv" = true;
      "terminal.integrated.gpuAcceleration" = "on";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.enableImages" = true;
      "terminal.integrated.smoothScrolling" = true;

      "gitlens.ai.experimental.provider" = "openai";

      # 在 VS Code 中重命名或移动文件时自动更新导入路径
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "typescript.updateImportsOnFileMove.enabled" = "always";

      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
      };
      "alejandra.program" = "alejandra";

      "[prisma]" = {
        "editor.defaultFormatter" = "Prisma.prisma";
      };

      "cSpell.userWords" = [
        "nixos"
        "nuxt"
      ];
    };
  };
}
