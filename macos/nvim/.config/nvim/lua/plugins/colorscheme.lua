return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = true,
      float = { transparent = true },
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin-transparent",
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.overlay1, bg = "NONE" },
          LineNrAbove = { fg = colors.overlay1, bg = "NONE" },
          LineNrBelow = { fg = colors.overlay1, bg = "NONE" },
          CursorLineNr = { fg = colors.lavender, bg = "NONE", bold = true },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
