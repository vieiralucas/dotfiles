return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      }
    }
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Find Help Tags" })
  end,
}
