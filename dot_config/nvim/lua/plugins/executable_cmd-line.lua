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
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
      local ls = require("luasnip")

      ls.add_snippets("cpp", {
        ls.snippet("cft", {
          ls.text_node({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "using ll = long long;",
            "using vi = vector<int>; using vll = vector<ll>;",
            "using pii = pair<int, int>; using pil = pair<int, ll>;",
            "",
            "void solve() {",
            "  ",
          }),
          ls.insert_node(1),
          ls.text_node({
            "",
            "}",
            "",
            "int main() {",
            "  ios_base::sync_with_stdio(false);",
            "  cin.tie(NULL);",
            "  int t; cin >> t;",
            "  while (t--) solve();",
            "  return 0;",
            "}",
          }),
        }),
        ls.snippet("cst", {
          ls.text_node({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "using ll = long long;",
            "using vi = vector<int>; using vll = vector<ll>;",
            "using pii = pair<int, int>; using pil = pair<int, ll>;",
            "",
            "void solve() {",
            "  ",
          }),
          ls.insert_node(1),
          ls.text_node({
            "",
            "}",
            "",
            "int main() {",
            "  ios_base::sync_with_stdio(false);",
            "  cin.tie(NULL);",
            "  solve();",
            "  return 0;",
            "}",
          }),
        }),
      })
    end,
  }
}
