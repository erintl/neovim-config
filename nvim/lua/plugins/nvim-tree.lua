return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local nvimtree = require("nvim-tree")

      nvimtree.setup({
        view = {
          width = 35,
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        git = {
          ignore = false,
        },
      })

      -- Keymaps
      local keymap = vim.keymap
      local opts = {}

      opts.desc = "Nvim Tree toggle"
      keymap.set("n", "<localleader>ee", "<cmd>NvimTreeToggle<CR>", opts)

      opts.desc = "Nvim Tree find file toggle"
      keymap.set("n", "<localleader>ef", "<cmd>NvimTreeFindFileToggle<CR>", opts)

      opts.desc = "Nvim Tree collapse"
      keymap.set("n", "<localleader>ec", "<cmd>NvimTreeCollapse<CR>", opts)

      opts.desc = "Nvim Tree refresh"
      keymap.set("n", "<localleader>er", "<cmd>NvimTreeRefresh<CR>", opts)
    end,
  },
}
