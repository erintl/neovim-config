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
  })

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
