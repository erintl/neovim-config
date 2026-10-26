return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- Group labels for the <leader> prefixes (labels only; the keymaps live with their plugins)
      spec = {
        {
          mode = { "n", "x" },
          { "<leader>b", group = "buffers" },
          { "<leader>c", group = "code (trouble)" },
          { "<leader>e", group = "explorer" },
          { "<leader>f", group = "find" },
          { "<leader>g", group = "git" },
          { "<leader>h", group = "git hunks" },
          { "<leader>l", group = "LSP" },
          { "<leader>lw", group = "workspace folders" },
          { "<leader>m", group = "format" },
          { "<leader>r", group = "run tests" },
          { "<leader>s", group = "splits / swap" },
          { "<leader>t", group = "tabs / terminal" },
          { "<leader>u", group = "UI toggles" },
          { "<leader>w", group = "sessions" },
          { "<leader>x", group = "trouble" },
        },
      },
    },
  },
}
