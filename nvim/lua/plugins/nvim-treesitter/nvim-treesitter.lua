return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.install({
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "cmake",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "embedded_template",
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gpg",
        "graphql",
        "groovy",
        "html",
        "java",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "kotlin",
        -- "latex",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "regex",
        "ruby",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
      })

      -- Filetypes whose builtin indent scripts rely on regex syntax groups, which
      -- treesitter highlighting turns off. Keep regex syntax running alongside it.
      local regex_syntax_filetypes = { ruby = true }

      -- Start treesitter highlighting and folding for any filetype with an installed parser.
      -- Indentation is left to the builtin indent scripts: treesitter's indentexpr is
      -- experimental and less accurate while typing.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.wo[0][0].foldmethod = "expr"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

            if regex_syntax_filetypes[args.match] then
              vim.bo[args.buf].syntax = args.match
            end
          end
        end,
      })
    end,
  },
}
