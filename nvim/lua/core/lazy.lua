-- Default colorscheme, e.g. "tokyonight" or "catppuccin-nvim" (not "catppuccin": that is the
-- built-in Vim port, not the plugin). Try others for the session
-- with the Telescope colorscheme picker (<leader>fs).
local default_colorscheme = "tokyonight"

local setup_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)

  local lazy = require("lazy")
  lazy.setup({
    { import = "plugins" },
    { import = "plugins.colorscheme" },
    { import = "plugins.completion" },
    { import = "plugins.lsp" },
    { import = "plugins.nvim-treesitter" },
    { import = "plugins.telescope" },
  }, {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
    install = {
      -- Used for the lazy.nvim UI while installing missing plugins on a fresh machine
      colorscheme = { default_colorscheme, "habamax" },
    },
  })

  -- Colorscheme plugins are lazy: lazy.nvim loads (and runs setup for) the one this names
  vim.cmd.colorscheme(default_colorscheme)

  -- Keymaps
  -- local keymap = vim.keymap
  --
  -- keymap.set("n", "<localleader>lh", lazy.home, { desc = "Lazy home" })
  -- keymap.set("n", "<localleader>ls", lazy.sync, { desc = "Lazy sync" })
  -- keymap.set("n", "<localleader>lc", lazy.clean, { desc = "Lazy clean" })
  -- keymap.set("n", "<localleader>lk", lazy.check, { desc = "Lazy check" })
  -- keymap.set("n", "<localleader>lp", lazy.profile, { desc = "Lazy profile" })
  -- keymap.set("n", "<localleader>lu", lazy.update, { desc = "Lazy update" })
  -- keymap.set("n", "<localleader>li", lazy.install, { desc = "Lazy install" })
  -- keymap.set("n", "<localleader>le", lazy.health, { desc = "Lazy health" })
end
setup_lazy()
