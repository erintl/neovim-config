return {
  {
    "tpope/vim-fugitive",
    init = function()
      vim.keymap.set("n", "<localleader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
    end,
  }
}
