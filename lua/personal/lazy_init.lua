-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'personal.lazy' },
    { import = 'kickstart.plugins.neo-tree' },
    -- { import = 'kickstart.plugins.gitsigns' },
  },
  change_detection = { notify = false },
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  {
    -- icons = {},
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = {},
      -- icons = vim.g.have_nerd_font and {} or {
      --   cmd = '⌘',
      --   config = '🛠',
      --   event = '📅',
      --   ft = '📂',
      --   init = '⚙',
      --   keys = '🗝',
      --   plugin = '🔌',
      --   runtime = '💻',
      --   require = '🌙',
      --   source = '📄',
      --   start = '🚀',
      --   task = '📌',
      --   lazy = '💤 ',
      -- },
    },
  },
}
