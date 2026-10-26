local M = {}

-- List of servers to automatically install, configure, and enable.
--- @type string[]
M.default_lsp_servers = {
  "vtsls",
  "html",
  "cssls",
  "lua_ls",
  "graphql",
  "emmet_language_server",
  "basedpyright",
  "ruby_lsp",
  "jsonls",
  "yamlls",
  "bashls",
  -- "sorbet",
}

-- Neovim provides these LSP keymaps by default (see `:h lsp-defaults`):
--   grn rename, gra code action, grr references, gri implementation,
--   grt type definition, grx run codelens, gO document symbols, K hover,
--   <C-s> (insert) signature help, [d / ]d diagnostics, <C-w>d diagnostic float
-- The mappings below add telescope pickers under <leader>l without overriding them.
function M.on_attach(_, bufnr)
  -- default options
  --- @param modes string|string[]
  --- @param lhs string
  --- @param rhs string|function
  --- @param opts? table
  local function set(modes, lhs, rhs, opts)
    local defaults = { noremap = true, silent = true, buffer = bufnr }
    local local_opts = vim.tbl_deep_extend("force", defaults, opts or {})

    vim.keymap.set(modes, lhs, rhs, local_opts)
  end
  local telescope_builtin = require("telescope.builtin")

  -- Go to
  set("n", "gd", telescope_builtin.lsp_definitions, { desc = "Go to LSP definitions" })
  set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

  -- Telescope pickers
  set("n", "<leader>lr", telescope_builtin.lsp_references, { desc = "Show LSP references" })
  set("n", "<leader>ld", telescope_builtin.lsp_definitions, { desc = "Show LSP definitions" })
  set("n", "<leader>li", telescope_builtin.lsp_implementations, { desc = "Show LSP implementations" })
  set("n", "<leader>lt", telescope_builtin.lsp_type_definitions, { desc = "Show LSP type definitions" })
  set("n", "<leader>ls", telescope_builtin.lsp_document_symbols, { desc = "Show document symbols" })
  set("n", "<leader>lS", telescope_builtin.lsp_dynamic_workspace_symbols, { desc = "Show workspace symbols" })
  set("n", "<leader>lD", function()
    telescope_builtin.diagnostics({ bufnr = 0 })
  end, { desc = "Show buffer diagnostics" })

  -- Server management
  set("n", "<leader>lf", function()
    require("conform").format({ lsp_format = "fallback", async = true })
  end, { desc = "Format buffer" })
  set("n", "<leader>rs", "<cmd>lsp restart<CR>", { desc = "Restart LSP" })
  set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "LSP add workspace folder" })
  set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP remove workspace folder" })
  set("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "LSP list workspace folders" })
end

return M
