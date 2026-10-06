return {
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    lazy = false,
    config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "c", "cpp", "rust", "python", "lua" },
    })
  end,
  },
  { "lewis6991/gitsigns.nvim", opts = {} },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "¦" } } },
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },
  { "folke/todo-comments.nvim", opts = {} },
}
