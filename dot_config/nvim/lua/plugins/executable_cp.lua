return {
  {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      local_cfg_directory = ".competitest",
      plugins_directory = vim.fn.stdpath("config") .. "/competitest",

      received_problems_path = "./$(JAVA_TASK_CLASS).$(FEXT)",
      received_contests_problems_path = "./$(JAVA_TASK_CLASS).$(FEXT)",
      received_contests_directory = ".",

      testcases_directory = "tests",
      testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
      testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

      open_split_source = "never",
      evaluate_template_modifiers = true,
      compile_directory = "bin",

      compile_command = {
        cpp = { 
          exec = "g++", 
          args = { "-O2", "-Wall", "-std=c++17", "../$(FNAME)", "-o", "$(FNOEXT)" } 
        },
      },

      running_directory = "bin",
      run_command = {
        cpp = { exec = "./$(FNOEXT)" },
      },
    },
    config = function(_, opts)
      require("competitest").setup(opts)
    end,
  },
}
