return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  -- Language Support
  ---- Frontend & NodeJS
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.vue" },
  ---- Configuration Language
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  ---- Backend / System
  { import = "astrocommunity.pack.lua" },
  ---- Operation & Cloud Native
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
}
