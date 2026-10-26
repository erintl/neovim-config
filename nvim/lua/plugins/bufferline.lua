return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "slant",
          show_close_icon = false,
          show_buffer_close_icons = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            }
          },
          color_icons = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
          end,
        },
      })
    end,
  },
}
