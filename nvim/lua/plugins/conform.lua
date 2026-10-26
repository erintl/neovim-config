return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          css = { "prettier" },
          html = { "prettier" },
          graphql = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          yaml = { "prettier" },
          lua = { "stylua" },
          -- Sort imports (ruff rule I001, never deletes any), then format
          python = { "ruff_organize_imports", "ruff_format" },
        },
        format_on_save = {
          lsp_format = "fallback",
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set(
        { "n", "v" },
        "<leader>mp",
        function()
          conform.format({
            lsp_format = "fallback",
            async = false,
            timeout_ms = 1000,
          })
        end,
        { desc = "Format file or range (in visual mode)" }
      )
    end,
  }
}
