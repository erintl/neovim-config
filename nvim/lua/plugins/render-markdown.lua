return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    -- Defaults: render in normal/command mode only, raw text on the cursor line
    opts = {
      -- No latex parser or converter installed (see nvim-treesitter.lua)
      latex = { enabled = false },
    },
    keys = {
      { "<leader>um", "<cmd>RenderMarkdown toggle<CR>", ft = "markdown", desc = "Toggle Markdown rendering" },
    },
  },
}
