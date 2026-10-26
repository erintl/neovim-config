return {
  {
    -- Match each file's existing indentation (tabs vs. spaces, width) when it opens.
    -- .editorconfig settings still take precedence; new files use the 2-space defaults.
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
