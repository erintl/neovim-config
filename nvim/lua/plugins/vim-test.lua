return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    cmd = { "TestFile", "TestNearest", "TestLast", "TestSuite", "TestVisit" },
    init = function()
      vim.g["test#strategy"] = "vimux"
    end,
    keys = {
      { "<leader>rb", "<cmd>TestFile<cr>", desc = "Run all tests in file" },
      { "<leader>rf", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>rl", "<cmd>TestLast<cr>", desc = "Re-run last test" },
      { "<leader>rd", "Obinding.pry<esc>", desc = "Insert binding.pry statement" },
    },
  },
}
