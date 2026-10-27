return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- Loaded on demand by `:colorscheme catppuccin-nvim` (or catppuccin-mocha, ...). Plain
    -- `catppuccin` is the Vim port built into Neovim 0.12, not this plugin.
    lazy = true,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      -- Turns on the integration for every plugin lazy.nvim has installed (blink.cmp,
      -- gitsigns, noice, snacks, telescope, trouble, which-key, ...). Entries in
      -- `integrations` below override or add to what it detects.
      auto_integrations = true,
      integrations = {
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = false,
        },
      },
    },
  },
}
