return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim", name = "tokyonight", priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000},
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      require("tokyonight").setup({ style = "night" })
      
      vim.opt.background = "dark"
      vim.cmd.colorscheme "moonfly"

      local themes = { "oxocarbon", "moonfly", "tokyonight-night", "catppuccin-mocha", "gruvbox"}
      local index = 1

      _G.RotateThemes = function()
        index = index % #themes + 1
        vim.cmd.colorscheme(themes[index])
        print("Theme set to: " .. themes[index])
      end
    end,
  },
}
