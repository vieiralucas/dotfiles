return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- Basic completion setup with LSP and buffer sources

      -- Set completion options
      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      local cmp = require "cmp"

      cmp.setup {
        -- Sources for completions (in order of priority)
        sources = {
          { name = "nvim_lsp" },  -- LSP completions
          { name = "buffer" },    -- Buffer completions
        },

        -- Key mappings
        mapping = {
          -- Navigate completion menu
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

          -- Confirm selection
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            { "i", "c" }
          ),

          -- Close completion menu
          ["<C-e>"] = cmp.mapping.abort(),
        },

        -- Basic formatting
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            -- Add source labels
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              buffer = "[Buffer]",
            })[entry.source.name] or ""

            return vim_item
          end,
        },
      }
    end,
  },
}
