return {
  {
    -- Auto-insert `end` (Ruby, Lua, Bash, Vimscript, ...) using treesitter
    "RRethy/nvim-treesitter-endwise",
    -- Must load before FileType fires, since it attaches to buffers from a FileType autocmd
    event = { "BufReadPre", "BufNewFile" },
  },
}
