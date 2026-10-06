local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitbelow = true
opt.splitright = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.clipboard = "unnamedplus"

-- Force xclip as the clipboard provider using absolute paths
vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = '/usr/bin/xclip -selection clipboard',
    ['*'] = '/usr/bin/xclip -selection primary',
  },
  paste = {
    ['+'] = '/usr/bin/xclip -selection clipboard -o',
    ['*'] = '/usr/bin/xclip -selection primary -o',
  },
  cache_enabled = 1,
}

-- Kitty/Terminal fixes
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function() io.stdout:write("\027[>1u") end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function() io.stdout:write("\027[<1u") end,
})
