-- Leader keys must be set before any mappings are defined or lazy.nvim loads plugins
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("core.mappings")
require("core.options")
require("core.lazy")
