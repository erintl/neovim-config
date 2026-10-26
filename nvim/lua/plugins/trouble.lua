return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter = { buf = 0 }<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false win = { position = right, size = 50 }<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win = { position = right, size = 50 }<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xt",
        "<cmd>Trouble todo toggle filter = { tag = { FIX, TODO, HACK, WARN, PERF, NOTE, TEST } }<CR>",
        desc = "Open TODOs in trouble",
      },
      {
        "<leader>xT",
        "<cmd>Trouble todo toggle filter = { buf = 0 }<CR>",
        desc = "Open buffer TODOs in trouble",
      },
    },
  },
}
