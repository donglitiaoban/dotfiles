local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
  },
  --{
  --  "zenbones-theme/zenbones.nvim",
  --  -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --  -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --  -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --  dependencies = "rktjmp/lush.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  -- you can set set configuration options here
  --  -- config = function()
  --  --     vim.g.zenbones_darken_comments = 45
  --  --     vim.cmd.colorscheme('zenbones')
  --  -- end
  --},
  {
    "typicode/bg.nvim",
    lazy = false,
    cond = jit.os ~= 'Windows',
  },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "keaising/im-select.nvim",
    cond = jit.os ~= 'Linux',
    config = function()
      require('im_select').setup({
        -- 异步执行不生效
        async_switch_im = false,
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        -- options here
        options = {
          icons_enabled = false,
          component_separators = '',
          section_separators = '',
        }
      })
    end,
  },
  {
    -- trim trailing whitespaces and empty lines
    "mcauley-penney/tidy.nvim",
  },
  -- Uncomment the two plugins below if you want to manage
  -- the language servers from neovim
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  -- {
  --   'f-person/auto-dark-mode.nvim',
  -- },
})
