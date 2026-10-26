return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup()

      -- Jump to context (upwards)
      local keymap = vim.keymap
      local treesitter_context = require("treesitter-context")
      local opts = { silent = true, desc = "Treesitter go to context" }
      keymap.set("n", "[z", treesitter_context.go_to_context, opts)
    end,
  },
}
