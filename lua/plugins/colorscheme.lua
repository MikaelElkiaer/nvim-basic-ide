return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end,
    lazy = false,
    opts = {
      bold = false,
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
      contrast = "hard",
      invert_tabline = true,
      transparent_mode = true,
    },
    priority = 1000,
  },
}
