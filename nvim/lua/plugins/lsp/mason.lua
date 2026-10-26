return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
      local lsp_servers = require("core/lsp_config").default_lsp_servers

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = lsp_servers,
        -- servers are enabled explicitly in nvim-lspconfig.lua, so that tools installed
        -- through mason (e.g. stylua) aren't also started as language servers
        automatic_enable = false,
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "eslint_d",
          "ruff",
          "shellcheck",
        },
      })
    end,
  },
}
