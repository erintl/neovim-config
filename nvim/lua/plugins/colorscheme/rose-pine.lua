return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- Loaded on demand by `:colorscheme rose-pine` (or rose-pine-main, -moon, -dawn)
    lazy = true,
    priority = 1000,
    opts = {
      variant = "main", -- main, moon, or dawn
    },
  },
}
