return {
  { 
    "folke/noice.nvim", 
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      routes = {
        {
          filter = { event = "msg_show", kind = "return_prompt" },
          opts = { skip = true },
        },
        {
          filter = { event = "msg_show", min_height = 5 },
          view = "split",
        },
      },
      views = { 
        cmdline_popup = { 
          position = { row = "50%", col = "50%" }, 
          size = { width = 60, height = "auto" } 
        } 
      },
      presets = { command_palette = true }
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = 'auto', section_separators = '', component_separators = '' } }
  },
  { "L3MON4D3/LuaSnip", version = "v2.*" }
}
