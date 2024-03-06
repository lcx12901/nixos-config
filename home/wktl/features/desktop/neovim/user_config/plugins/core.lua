return {
  {
    "keaising/im-select.nvim",
    lazy = false,
    config = function() require("im_select").setup() end,
  },

  {
    "folke/flash.nvim",
    opts = {
      label = {
        rainbow = {
          enabled = true,
          shade = 5,
        },
      },
    },
  },

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

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      -- Other blankline configuration here
      return require("indent-rainbowline").make_opts(opts)
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },
}
