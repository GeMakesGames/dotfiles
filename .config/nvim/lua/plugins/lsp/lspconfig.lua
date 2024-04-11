return {

	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{ 'antosha417/nvim-lsp-file-operations', config = true },
	},
	config = function()
		local lspconfig = require('lspconfig')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }
		local on_attach = function(_client, _bufnr)
			keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
			keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
			keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
			keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
			keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
			keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
			keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
			keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
			keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
			keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
			keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
			keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig['lua_ls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					},
					workspace = {
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.stdpath('config') .. '/lua'] = true,
						}
					},
				},
			},
		})

		lspconfig['omnisharp'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {'omnisharp'},
			enable_import_completion = true,
		})
	end,
}
