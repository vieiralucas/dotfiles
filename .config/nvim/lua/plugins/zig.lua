return {
  "ziglang/zig.vim",
  ft = { "zig", "zon" },
  init = function()
    vim.g.zig_fmt_autosave = 0
  end,
}
