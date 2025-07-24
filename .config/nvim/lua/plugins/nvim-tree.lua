return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvim_tree = require('nvim-tree')

    nvim_tree.setup()

    -- bind <C-n> to toggle nvim-tree
    vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
