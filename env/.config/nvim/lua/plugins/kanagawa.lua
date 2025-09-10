return {
  "rebelot/kanagawa.nvim",
  config = function()
    require('kanagawa').setup({
      compile = true,
      transparent = true,
      overrides = function(colors)
        return {
          SignColumn = { bg = "none" },
          LineNr = { bg = "none" },
          CursorLineNr = { bg = "none" },
        }
      end,
    });
    vim.cmd("colorscheme kanagawa");
  end,
  build = function()
    vim.cmd("KanagawaCompile");
  end,
}
