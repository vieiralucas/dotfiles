return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvim_tree = require('nvim-tree')
    local colors = require("bow.palette")

    nvim_tree.setup()

    local function hi(group, opts)
      vim.api.nvim_set_hl(0, group, opts)
    end

    hi("NvimTreeFolderIcon",       { fg = colors.soft_fg })
    hi("NvimTreeIndentMarker",     { fg = colors.mid_gray })
    hi("NvimTreeExecFile",         { fg = colors.fg })
    hi("NvimTreeRootFolder",       { fg = colors.fg, bold = true })
    hi("NvimTreeGitDirty",         { fg = colors.mid_gray })
    hi("NvimTreeGitNew",           { fg = colors.mid_gray })
    hi("NvimTreeGitDeleted",       { fg = colors.mid_gray })
    hi("NvimTreeFolderName",       { fg = colors.soft_fg })
    hi("NvimTreeOpenedFolderName", { fg = colors.fg, bold = true })
    hi("NvimTreeEmptyFolderName",  { fg = colors.mid_gray })
  end,
}
