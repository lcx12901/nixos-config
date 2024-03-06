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
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        local utils = require("astronvim.utils")
        opts.incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>", -- Ctrl + Space
            node_incremental = "<C-space>",
            scope_incremental = "<A-space>", -- Alt + Space
            node_decremental = "<bs>", -- Backspace
          },
        }
        opts.ignore_install = { "gotmpl" }
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
          -- neovim
          "vim",
          "lua",
          -- operation & cloud native
          "dockerfile",
          "hcl",
          "jsonnet",
          "regex",
          "terraform",
          "nix",
          "csv",
          -- other programming language
          "diff",
          "gitignore",
          "gitcommit",
          "latex",
          "sql",
          -- Lisp like
          "fennel",
          "clojure",
          "commonlisp",
          -- customized languages:
          "scheme",
        })

        -- add support for scheme
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.scheme = {
          install_info = {
            url = "https://github.com/6cdh/tree-sitter-scheme", -- local path or git repo
            files = { "src/parser.c" },
            -- optional entries:
            branch = "main",                  -- default branch in case of git repo if different from master
            generate_requires_npm = false,    -- if stand-alone parser without npm dependencies
            requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
          },
        }
        -- use scheme parser for filetypes: scm
        vim.treesitter.language.register("scheme", "scm")
      end,
    },
    { "Olical/nfnl",                                       ft = "fennel" },
    -- Lua implementation of CamelCaseMotion, with extra consideration of punctuation.
    { import = "astrocommunity.motion.nvim-spider" },
    {
      "0x00-ketsu/autosave.nvim",
      -- lazy-loading on events
      event = { "InsertLeave", "TextChanged" },
      opts = function(_, opts)
        opts.prompt_style = "stdout" -- notify or stdout
      end,
    },
    -- File explorer(Custom configs)
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true, -- visible by default
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      },
    },
    -- The plugin offers the alibity to refactor code.
    {
      "ThePrimeagen/refactoring.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    },
    -- The plugin offers the abilibty to search and replace.
    {
      "nvim-pack/nvim-spectre",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
      },
    },
  },
}
