local set_mappings = function()
  local keymap = vim.keymap
  local opts = { silent = true }

  keymap.set("n", "<localleader>nh", vim.cmd.noh, { desc = 'Hide search highlights' })
  -- Remap for dealing with word wrap
  keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  opts.desc = "Move line up"
  keymap.set("n", "<C-k>", ":m -2<CR>==", opts)

  opts.desc = "Move line down"
  keymap.set("n", "<C-j>", ":m +1<CR>==", opts)

  opts.desc = "Move selection up"
  keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", opts)

  opts.desc = "Move selection down"
  keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", opts)

  -- ]b / [b (next / previous buffer) are Neovim defaults

  opts.desc = "Exit insert mode"
  keymap.set("i", "jk", "<ESC>", opts)

  -- window management
  opts.desc = "Split window vertically"
  keymap.set("n", "<localleader>sv", "<C-w>v", opts)

  opts.desc = "Split window horizontally"
  keymap.set("n", "<localleader>sh", "<C-w>s", opts)

  opts.desc = "Set splits to equal size"
  keymap.set("n", "<localleader>se", "<C-w>=", opts)

  opts.desc = "Close current split"
  keymap.set("n", "<localleader>sx", "<cmd>close<CR>", opts)

  opts.desc = "Open new tab"
  keymap.set("n", "<localleader>to", "<cmd>tabnew<CR>", opts)

  opts.desc = "Close current tab"
  keymap.set("n", "<localleader>tx", "<cmd>tabclose<CR>", opts)

  opts.desc = "Go to next tab"
  keymap.set("n", "<localleader>tn", "<cmd>tabn<CR>", opts)

  opts.desc = "Go to previous tab"
  keymap.set("n", "<localleader>tp", "<cmd>tabp<CR>", opts)

  opts.desc = "Open current buffer in new tab"
  keymap.set("n", "<localleader>tf", "<cmd>tabnew %<CR>", opts)
end
set_mappings()
