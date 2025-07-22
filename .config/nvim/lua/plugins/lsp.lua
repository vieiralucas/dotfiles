return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Setup Mason
      require("mason").setup()

      local servers = {
        lua_ls = {},
        rust_analyzer = {},
        gopls = {},
        pyright = {},
        ts_ls = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        clangd = {},
        ocamllsp = {},
        terraformls = {},
      }

      -- Setup Mason LSP installer
      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      for name, config in pairs(servers) do
        lspconfig[name].setup(config)
      end

      -- Configure Lua LSP
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Keymaps for LSP
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

      -- Show diagnostics in a floating window
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Show line diagnostics automatically in hover window
      vim.o.updatetime = 250
      vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    end,
  },
}
