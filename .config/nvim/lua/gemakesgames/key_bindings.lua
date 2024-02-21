local nnoremap = require("gemakesgames.keymap_utils").nnoremap
local vnoremap = require("gemakesgames.keymap_utils").vnoremap
local inoremap = require("gemakesgames.keymap_utils").inoremap
local tnoremap = require("gemakesgames.keymap_utils").tnoremap
local xnoremap = require("gemakesgames.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

nnoremap("<leader>e", function()
	require("oil").toggle_float()
end)
nnoremap("<leader>S", function()
	require("spectre").toggle()
end)
nnoremap("<leader>f", ":Format<cr>")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end)

nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end)

nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end)
nnoremap("<C-1>", function()
	harpoon_ui.nav_file(1)
end)

nnoremap("<C-2>", function()
	harpoon_ui.nav_file(2)
end)

nnoremap("<C-3>", function()
	harpoon_ui.nav_file(3)
end)

nnoremap("<C-4>", function()
	harpoon_ui.nav_file(4)
end)

nnoremap("<C-5>", function()
	harpoon_ui.nav_file(5)
end)
