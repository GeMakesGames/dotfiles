return {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'mfussenegger/nvim-dap',
		'jay-babu/mason-nvim-dap.nvim',
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'theHamsta/nvim-dap-virtual-text',
		'folke/neodev.nvim',
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local mason_nvim_dap = require('mason-nvim-dap')
		local nvim_dap_virtual_text = require('nvim-dap-virtual-text')
		local neodev = require('neodev')
		local dap, dapui = require('dap'), require('dapui')
		mason.setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				'lua_ls',
				'omnisharp',
			},
			automatic_installation = true,

		})
		mason_nvim_dap.setup({
			ensure_installed = {
				'coreclr'
			},
			handlers = {}
		})
		nvim_dap_virtual_text.setup()
		neodev.setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
