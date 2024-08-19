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
    "typicode/bg.nvim",
    lazy = false,
    cond = jit.os ~= 'Windows',
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "keaising/im-select.nvim",
    cond = jit.os == 'Windows',
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
  --   config = function()
  --         end,
  -- },
})
