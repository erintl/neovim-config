return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      { "b0o/SchemaStore.nvim", lazy = true, version = false },
    },
    config = function()
      local lsp_config = require("core/lsp_config")
      local lsp_server_on_attach = lsp_config.on_attach

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { current_line = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = "󰠠 ",
          },
        },
      })
      -- Set keymaps via LspAttach rather than `on_attach`, since some server configs
      -- (e.g. ts_ls, pyright) define their own `on_attach` that would override ours.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(args)
          lsp_server_on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
        end,
      })

      -- Configure language servers
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("ruby_lsp", {
        -- Send edits immediately. ruby-lsp parses a request's document before applying edits still
        -- queued ahead of it, so blink.cmp's completion request (sent right after the batched edit)
        -- would otherwise be answered from the pre-keystroke text and return no/stale items.
        flags = { debounce_text_changes = 0 },
        init_options = {
          formatter = "standard",
          linters = { "standard" },
        },
      })

      -- Only start Sorbet in projects that use it (have a `sorbet/config`), otherwise
      -- `srb tc --lsp` errors in every plain Ruby project. Not calling `on_dir` skips the server.
      vim.lsp.config("sorbet", {
        root_dir = function(bufnr, on_dir)
          local root = vim.fs.root(bufnr, { "Gemfile", ".git" })
          if root and vim.uv.fs_stat(root .. "/sorbet/config") then
            on_dir(root)
          end
        end,
      })

      -- JSON and YAML schemas (package.json, tsconfig, GitHub workflows, docker-compose, ...)
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            -- Disable the builtin schemastore support in favor of SchemaStore.nvim
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })

      -- Only servers in the list are enabled (mason-lspconfig's automatic_enable is off)
      vim.lsp.enable(lsp_config.default_lsp_servers)
    end,
  },
}
