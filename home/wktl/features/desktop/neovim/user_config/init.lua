return {
  options = {
    opt = {
      relativenumber = true, -- Show relative numberline
      signcolumn = "auto", -- Show sign column when used only
      spell = true,      -- Spell checking
      swapfile = false,   -- Swapfile
      title = true,       -- Set the title of window to `filename [+=-] (path) - NVIM`
      titlelen = 20,
    },
  },

  plugins = {
    "AstroNvim/astrocommunity",
    -- Motion
    { import = "astrocommunity.motion.mini-surround" },
    -- It allows you to reach any target in a very fast
    { import = "astrocommunity.motion.leap-nvim" },
    { import = "astrocommunity.motion.flit-nvim" },
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

    -- colorscheme
    { import = "astrocommunity.colorscheme.catppuccin" },

    {
      "catppuccin/nvim",
      name = "catppuccin",
      opts = function(_, opts)
        opts.flavour = "mocha"              -- latte, frappe, macchiato, mocha
        opts.transparent_background = true -- setting the background color.
      end,
    },
    -- Language Parser for syntax highlighting / indentation / folding / Incremental selection
  },
}
