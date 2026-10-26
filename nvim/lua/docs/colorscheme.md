# Colorscheme Cofigurations

## Catppuccin

### Catpuuccin Plugin

```lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("catppuccin").setup({
        integrations = {
          alpha = true,
          cmp = true,
          fidget = true,
          gitsigns = true,
          harpoon = true,
          headlines = true,
          indent_blankline = {
            enabled = true,
            scope_color = "mauve",
            colored_indent_levels = true,
          },
          lsp_trouble = true,
          mason = true,
          nvimtree = true,
          symbols_outline = true,
          treesitter_context = true,
          treesitter = true,
          which_key = true,
        },
      })
      -- vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
```

### Fidget

```lua
config = function()
  require("fidget").setup({
    window = {
      blend = 0, -- For catppuccin theme.
    },
  })
end,
```

### Bufferline

```lua
config = function()
  local  mocha = require("catppuccin.palettes").get_palette("mocha")
  require("bufferline").setup({
    highlights = require("catppuccin.groups.integrations.bufferline").get {
      styles = { "italic", "bold" },
      custom = {
        all = {
         fill = { bg = "#000000" },
        },
        mocha = {
          background = { fg = mocha.text },
        },
        latte = {
          background = { fg = "#000000" },
        },
      },
    },
    options = {
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
```
