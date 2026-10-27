-- Disable netrw; nvim-tree replaces it. Set early, before any plugin loads.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim options (Neovim defaults such as hlsearch, incsearch, ruler, autoindent and
-- backspace=indent,eol,start are not repeated here)
local opt = vim.opt

opt.termguicolors = true
opt.showmatch = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartcase = true
opt.ignorecase = true
opt.wildignore = { ".git", "*/build/*" }
opt.showmode = false
opt.cursorline = true
-- vim.opt.completeopt= { "menuone", "noselect" }
opt.updatetime = 250
opt.timeoutlen = 500
opt.breakindent = true
opt.signcolumn = "yes"
-- Not redundant: Neovim detects the terminal background, and tokyonight switches to
-- its light "day" style when it is light
opt.background = "dark"
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.list = true
opt.winborder = "rounded" -- border for floating windows (LSP hover, signature help, ...)

-- Folding
opt.foldlevel = 99

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
