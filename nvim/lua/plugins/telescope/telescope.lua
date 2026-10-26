return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Track main: the last release (v1.1.0) still calls the deprecated vim.tbl_flatten
      { "nvim-telescope/telescope-live-grep-args.nvim", version = false },
      "folke/todo-comments.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")
      local open_with_trouble = require("trouble.sources.telescope").open

      telescope.setup({
        defaults = {
          layout_config = {
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.5,
          },
          path_display = { "smart" },
          mappings = {
            i = {
              ["<c-o>"] = open_with_trouble,
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = { ["<c-o>"] = open_with_trouble },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            follow = true,
            file_ignore_patterns = {
              "^%.git/", -- lua patterns, not globs
              "%.rbi$",
            },
          },
          git_files = {
            show_untracked = true,
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-p>"] = lga_actions.quote_prompt(),
                -- Not <C-i>: terminals send it as <Tab>, which would shadow multi-select
                ["<C-g>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                -- freeze the current list and start a fuzzy search in the frozen list
                ["<C-space>"] = lga_actions.to_fuzzy_refine,
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")

      -- Setup mappings
      local keymap = vim.keymap
      local builtin = require("telescope.builtin")
      local live_grep_args = telescope.extensions.live_grep_args
      local opts = {}

      opts.desc = "Telescope find files"
      keymap.set("n", "<leader>ff", builtin.find_files, opts)

      opts.desc = "Telescope live grep args"
      keymap.set("n", "<leader>fr", live_grep_args.live_grep_args, opts)

      opts.desc = "Telescope git files"
      keymap.set("n", "<leader>fg", builtin.git_files, opts)

      opts.desc = "Telescope buffers"
      keymap.set("n", "<leader>fb", builtin.buffers, opts)

      opts.desc = "Telescope help tags"
      keymap.set("n", "<leader>fh", builtin.help_tags, opts)

      opts.desc = "Telescope current buffer fuzzy find"
      keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, opts)

      opts.desc = "Telescope old files"
      keymap.set("n", "<leader>fo", builtin.oldfiles, opts)

      opts.desc = "Telescope grep string"
      keymap.set("n", "<leader>fw", builtin.grep_string, opts)

      opts.desc = "Telescope diagnostics"
      keymap.set("n", "<leader>fd", builtin.diagnostics, opts)

      opts.desc = "Telescope quickfix"
      keymap.set("n", "<leader>fq", builtin.quickfix, opts)

      opts.desc = "Telescope colorscheme"
      keymap.set("n", "<leader>fs", function()
        builtin.colorscheme({ enable_preview = true })
      end, opts)

      opts.desc = "Telescope find TODOs"
      keymap.set("n", "<localleader>ft", "<cmd>TodoTelescope<cr>", opts)
    end,
  },
}
