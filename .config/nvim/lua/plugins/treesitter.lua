return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "rust",
        "ocaml",
        "go",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "python",
        "json",
        "yaml",
        "markdown",
        "bash",
        "html",
        "css",
        "sql",
        "zig"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      modules = {}
    })
  end,
}
