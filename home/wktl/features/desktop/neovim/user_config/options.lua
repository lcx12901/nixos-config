return {
  opt = {
    relativenumber = true, -- Show relative numberline
    number = true,
    signcolumn = "auto", -- Show sign column when used only
    spell = true,      -- Spell checking
    swapfile = false,   -- Swapfile
    title = true,       -- Set the title of window to `filename [+=-] (path) - NVIM`
    titlelen = 20,
    wrap = true,
    conceallevel = 2, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    -- listchars = { tab = " ", extends = "⟩", precedes = "⟨", trail = "·", eol = "﬋" },
    showbreak = "↳ ",
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
  },
}
