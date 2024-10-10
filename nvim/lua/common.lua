-- global options:
-- vim.o
-- set global variables like g:xxx = 1 in vim9script
-- vim.g
-- window-local options:
-- vim.wo
-- buffer-local options:
-- vim.bo

-- local encoding = 'UTF-8'
-- v.g.encoding = encoding
-- vim.o.fileencoding = encoding

local indent_value = 2
vim.o.tabstop = indent_value
vim.bo.tabstop = indent_value
vim.o.softtabstop = indent_value
vim.o.shiftround = true
-- in normal mode: > for add a indent, < for remove a indent
-- shiftwidth for > < spaces
vim.o.shiftwidth = indent_value
vim.o.expandtab = true
vim.bo.expandtab = true

-- padding spaces when cursor moves to window boarder
local scrolloff = 4
vim.o.scrolloff = scrolloff
vim.o.sidescrolloff = scrolloff

vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'

vim.o.clipboard = 'unnamedplus'

-- highlight column on no.80 char
vim.o.colorcolumn = '80'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.autoread = true
vim.bo.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- enable mouse support in normal and visual mode only
vim.o.mouse = 'nv'
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.completeopt = "menu,menuone,noselect,noinsert"

if jit.os == 'Windows' then
  vim.o.shell = 'pwsh.exe'
end
