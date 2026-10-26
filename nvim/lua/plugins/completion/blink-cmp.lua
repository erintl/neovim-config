return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- release tags download the prebuilt Rust fuzzy matcher
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "none",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        -- only confirms an explicitly selected item (nothing is preselected)
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        accept = { auto_brackets = { enabled = true } },
        documentation = { auto_show = true },
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
      },
      -- signature help is provided by noice
      signature = { enabled = false },
      cmdline = { enabled = false },
      snippets = { preset = "default" },
      sources = {
        default = { "lsp", "snippets", "buffer", "path" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          -- completion source for require statements and module annotations
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          snippets = {
            opts = { extended_filetypes = { ruby = { "rails" } } },
          },
        },
      },
    },
  },
}
