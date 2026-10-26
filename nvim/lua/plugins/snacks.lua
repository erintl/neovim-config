return {
  {
    "folke/snacks.nvim",
    -- Load early so the notifier replaces vim.notify before other plugins use it
    priority = 1000,
    lazy = false,
    opts = {
      notifier = {
        enabled = true,
        timeout = 3000,
        width = { min = 40, max = 0.75 },
        height = { min = 1, max = 0.75 },
      },
      terminal = {
        win = {
          position = "bottom",
          height = 30,
          -- <Esc> always goes to the program in the terminal (no double-<Esc> to normal mode)
          keys = { term_normal = false },
        },
      },
    },
    keys = {
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      -- Normal mode only: a terminal-mode <leader> mapping would delay every `\` typed in the shell
      { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle terminal" },
    },
    init = function()
      -- Terminal mode keymaps. <Esc> and <C-w> are left alone so they reach the
      -- program running in the terminal (e.g. lazygit, fzf, shell delete-word).
      vim.api.nvim_create_autocmd("TermOpen", {
        group = vim.api.nvim_create_augroup("TerminalKeymaps", { clear = true }),
        pattern = "term://*",
        callback = function(args)
          local keymap = vim.keymap
          local opts = { buffer = args.buf }
          keymap.set("t", "jk", [[<C-\><C-n>]], opts)
          keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
          keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
          keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
          keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end,
      })
    end,
  },
}
