return {
  {
    -- Edit the filesystem like a buffer (rename/move/create/delete, then :w). Used alongside nvim-tree.
    "stevearc/oil.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    -- Lazy-loading is fine because nvim-tree keeps handling directory buffers (`nvim .`)
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory (oil)" },
    },
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
    },
  },
}
