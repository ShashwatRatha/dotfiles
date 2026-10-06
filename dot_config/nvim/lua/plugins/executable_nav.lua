return {
  { 
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end
  },
  { 
    "nvim-neo-tree/neo-tree.nvim", 
    lazy = false,
    branch = "v3.x", 
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    opts = {
      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "neo-tree" },
      enable_git_status = true,
      filesystem = {
        hijack_netrw_behavior = "open_default",
        filtered_items = { visible = true, hide_dotfiles = false, hide_gitignore = false }, 
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "✚",
            deleted   = "✖",
            modified  = "",
            renamed   = "➜",
            untracked = "★",
            ignored   = "◯",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          }
        }
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#6c7086", italic = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { bold = true })
      require("neo-tree").setup(opts)
    end
  },
}
