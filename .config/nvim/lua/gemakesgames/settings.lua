vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.nu = true
vim.o.rnu = true

vim.o.showmode = false
vim.o.swapfile = false

vim.o.clipboard = 'unnamedplus'

vim.o.wrap = false
vim.o.breakindent = true
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.otimeoutlen = 300

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.o.colorcolumn = '80'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
