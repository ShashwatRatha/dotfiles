return {
  { 
    "akinsho/toggleterm.nvim", 
    opts = { open_mapping = [[<c-\>]], direction = 'horizontal' },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      local Terminal = require('toggleterm.terminal').Terminal
      local horiz = Terminal:new({ direction = "horizontal" })
      local vert = Terminal:new({ direction = "vertical" })
      
      vim.keymap.set("n", "<leader>th", function() horiz:toggle(vim.o.lines * 0.5) end)
      vim.keymap.set("n", "<leader>tv", function() vert:toggle(vim.o.columns * 0.3) end)
    end
  },
  { 
    "mfussenegger/nvim-dap", 
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
  },
}
