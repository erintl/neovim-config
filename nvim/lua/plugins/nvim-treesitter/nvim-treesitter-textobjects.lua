return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        },
        move = {
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      })

      local keymap = vim.keymap
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      -- Select (you can use the capture groups defined in textobjects.scm)
      local select_keymaps = {
        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
        ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["al"] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["ar"] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
        ["ao"] = { query = "@block.outer", desc = "Select outer part of a block" },
        ["io"] = { query = "@block.inner", desc = "Select inner part of a block" },
      }
      for lhs, map in pairs(select_keymaps) do
        keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(map.query, "textobjects")
        end, { desc = map.desc })
      end

      -- Move
      local move_keymaps = {
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      }
      for fn, maps in pairs(move_keymaps) do
        for lhs, query in pairs(maps) do
          keymap.set({ "n", "x", "o" }, lhs, function()
            move[fn](query, "textobjects")
          end, { desc = fn:gsub("_", " ") .. " " .. query })
        end
      end

      -- Some builtin ftplugins (e.g. ruby, python) define buffer-local versions of these
      -- motions, which shadow the ones above. Ruby's rely on regex syntax, which is
      -- disabled once treesitter highlighting starts, so remove them.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterTextobjectsMove", { clear = true }),
        callback = function(args)
          for _, maps in pairs(move_keymaps) do
            for lhs in pairs(maps) do
              for _, mode in ipairs({ "n", "x", "o" }) do
                pcall(keymap.del, mode, lhs, { buffer = args.buf })
              end
            end
          end
        end,
      })

      -- Swap
      keymap.set("n", "<leader>sp", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap with next parameter" })
      keymap.set("n", "<leader>sf", function()
        swap.swap_next("@function.outer")
      end, { desc = "Swap with next function" })
      keymap.set("n", "<leader>sP", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap with previous parameter" })
      keymap.set("n", "<leader>sF", function()
        swap.swap_previous("@function.outer")
      end, { desc = "Swap with previous function" })

      -- Setup repeatable moves
      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
      keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
      keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
      keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
}
